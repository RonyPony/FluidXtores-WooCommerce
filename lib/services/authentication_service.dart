import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluidxtores/constants.dart';
import 'package:fluidxtores/models/reques_response.dart';
import 'package:fluidxtores/models/user.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluidxtores/contracts/authentication_service_contract.dart';
import 'package:fluidxtores/helper/network_util.dart';
import 'package:fluidxtores/models/client_user.dart';
import 'package:fluidxtores/models/new_password_request.dart';
import 'package:fluidxtores/models/store.dart';
import 'package:fluidxtores/models/user_response.dart';

import '../helper/ecommerceConnectionInfo.dart';
import '../models/authUser.dart';
import '../models/user_login_response.dart';

class AuthenticationService implements AuthenticationServiceContract {
  static const String? AUTHENTICATION_NUMBER_KEY =
      'amountOfTimesUserHasAuthenticated';
  static UserResponse? currentUser;
  static const String? SAVED_USER_KEY = 'savedUserForAgrimensorLogin';
  var cliente = Dio();

  @override
  Future<int> amountOfTimesUserHasLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(AUTHENTICATION_NUMBER_KEY!)) {
      return sharedPreferences.getInt(AUTHENTICATION_NUMBER_KEY!)!;
    }
    return 0;
  }

  @override
  Future<UserResponse> getCurrentLoggedUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (currentUser != null) {
      return currentUser!;
    }
    final savedUserJson = sharedPreferences.getString(SAVED_USER_KEY!);
    if (savedUserJson != null && savedUserJson.isNotEmpty) {
      final decodedJson = jsonDecode(savedUserJson);
      currentUser = UserResponse.fromJson(decodedJson);
      return currentUser!;
    }
    return UserResponse();
  }

  void saveTempUser(ClientUser _user) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String? usr = jsonEncode(_user.toJson());

      sharedPreferences.setString(NetworkUtil.TEMP_USER_KEY!, usr);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> loginRequest(
      User user, EcommerceConnectionInfo wooInfo) async {
    if (user.username == null) {
      return GeneralError(message: "Username is empty");
    } else if (user.password == null) {
      return GeneralError(message: "Password is empty");
    }
    String? host = wooInfo.url;
    if (!host!.endsWith('/')) host += "/";
    String? url = host + 'api/users/login';
    Response? response;
    try {
      var formData = {'userEmail': user.username, 'userPassword': user.password};
      response = await cliente.post<Map<String,dynamic>>(url, data: formData);
      if (response.statusCode==200) {
        UserLoginReponse dataResponse =
            await UserLoginReponse.fromJson(response.data);
        return dataResponse;
      }
    } on DioError catch (e) {
      if(e.response!.statusCode==400){
        return e.response!.statusMessage;
      }else{
        return "Server returner unknown error";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<dynamic> searchUserByEmail(String? email) async {
    String? host = serverurl;
    if (!host!.endsWith('/')) host += "/";
    String? url = host + 'api/users/find?email=$email';

    var response = await cliente.get(url);
    UserLoginReponse dataResponse = await UserLoginReponse.fromJson(response.data[0]);
    print(dataResponse);
    return dataResponse;
  }

  @override
  Future<UserLoginReponse> logInUser(ClientUser user, bool remember) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    EcommerceConnectionInfo flutterWoocommerce =
        EcommerceConnectionInfo(url: serverurl);
    // FlutterWoocommerce(
    //     url: serverurl, consumerKey: apikey, consumerSecret: secret);
    var result = await loginRequest(
        User(username: user.email, password: user.password),
        flutterWoocommerce);
    if (result is UserLoginReponse) {
      if (remember) {
        getCurrentLoggedUser();
        final jsonData = jsonEncode(currentUser!.toJson());
        sharedPreferences.setString(SAVED_USER_KEY!, jsonData);
      } else {
        await sharedPreferences.remove(SAVED_USER_KEY!);
      }
      await _incrementNumberOfLogins();
      return result;
    } else {
      print('error');
    }

    return UserLoginReponse();

    // if (result is! GeneralError) {
    //   RequestResponse AuthedUser = result;
    //   print(AuthedUser.message);
    // } else {
    //   GeneralError err = result;
    //   if (err == 'jwt_auth_valid_credential') {
    //     // final users = new UserResponse.fromJson(result.data);
    //     // final sharedPreferences = await SharedPreferences.getInstance();
    //     // UserResponse userLogged = users;
    //     // userLogged.rememberLogin = remember;
    //     // currentUser = users;
    //     // if (remember) {
    //     //   final jsonData = jsonEncode(currentUser.toJson());
    //     //   sharedPreferences.setString(SAVED_USER_KEY, jsonData);
    //     // } else {
    //     //   await sharedPreferences.remove(SAVED_USER_KEY);
    //     // }
    //     // await _incrementNumberOfLogins();
    //     currentUser = UserResponse(email: user.email, isAuthenticated: true);
    //     return currentUser;
    //   }
    //   print(err.message);
    // } // String? responseMessage = '';
    // try {
    //   final sharedPreferences = await SharedPreferences.getInstance();
    //   final client = NetworkUtil.getClient();
    //   final queryParams = {'username': user.email, 'password': user.password};

    //   final tokenResponse =
    //       await client.post('jwt-auth/v1/token', queryParameters: queryParams);
    //   if (tokenResponse.statusCode < 400) {
    //     final data = tokenResponse.data;
    //     final token = TokenResponse.fromJson(data);
    //     final date = DateTime.now().toIso8601String();

    //     sharedPreferences.setString(
    //         NetworkUtil.AUTH_TOKEN_KEY, token.accessToken);
    //     sharedPreferences.setString(NetworkUtil.AUTH_TOKEN_DATE, date);
    //     final loginClient = NetworkUtil.getTokenClient();
    //     final response =
    //         await loginClient.get('accounts/customers?email=${user.email}');

    //     final users = new UserResponse.fromJson(response.data);
    //     UserResponse userLogged = users;
    //     userLogged.rememberLogin = remember;
    //     currentUser = users;
    //     if (remember) {
    //       final jsonData = jsonEncode(currentUser.toJson());
    //       sharedPreferences.setString(SAVED_USER_KEY, jsonData);
    //     } else {
    //       await sharedPreferences.remove(SAVED_USER_KEY);
    //     }
    //     await _incrementNumberOfLogins();
    //     return currentUser;
    //   }

    //   if (tokenResponse.data['error_description'] == 'Access Denied') {
    //     responseMessage = "invalidUsernameOrPassword";
    //     throw PlatformException(
    //         code: "${tokenResponse.statusCode}", message: responseMessage);
    //   }

    //   throw PlatformException(
    //       code: "${tokenResponse.statusCode}",
    //       message: "invalidUsernameOrPassword");
    // } catch (e) {
    //   throw Exception(responseMessage);
    // }
  }

  Future _incrementNumberOfLogins() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(AUTHENTICATION_NUMBER_KEY!)) {
      sharedPreferences.setInt(AUTHENTICATION_NUMBER_KEY!, 1);
    } else {
      final val = sharedPreferences.getInt(AUTHENTICATION_NUMBER_KEY!) ?? 0;
      sharedPreferences.setInt(AUTHENTICATION_NUMBER_KEY!, val + 1);
    }
  }

  @override
  Future signOutUser() async {
    currentUser = null;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(NetworkUtil.AUTH_TOKEN_KEY!);
    sharedPreferences.remove(NetworkUtil.AUTH_TOKEN_DATE!);
  }

  @override
  Future<String?> register(ClientUser user) async {
    String? errorMessage = '';
    try {
      final client = NetworkUtil.getClient();

      final response = await client.post('clients', data: user.toJson());

      if (response.statusCode! < 400) {
        return response.data['CustomerId'].toString();
      }

      errorMessage = _getErrorMessage(response.data);

      throw PlatformException(
          code: "${response.statusCode}",
          message: "RegistrationError.",
          details: '${response.data['message']}');
    } catch (e) {
      errorMessage = errorMessage!.isEmpty ? e.toString() : errorMessage;
      throw Exception(errorMessage);
    }
  }

  String? _getErrorMessage(Map<String?, dynamic> jsonModel) {
    if (jsonModel['Message'] != null) {
      return jsonModel['Message'];
    } else if (jsonModel['message'] != null) {
      return jsonModel['message'];
    } else {
      // ignore: unused_local_variable
      var title = jsonModel['title'];
      // ignore: unused_local_variable
      var status = jsonModel['status'];
      Map errors = jsonModel['errors'];

      var messages = errors.values
          .where((element) => element.toString().isNotEmpty)
          .toList();
      var result = messages[0].elementAt(0);
      return result;
    }
  }

  @override
  Future resendConfirmationEmail(String? customerId) async {
    String? errorMessage = '';
    try {
      final client = NetworkUtil.getClient();

      final response = await client
          .get('contact-confirmation/send-email-validation/$customerId');

      if (response.statusCode == 400) {
        errorMessage = _getErrorMessage(json.decode(response.data));

        throw PlatformException(
            code: "${response.statusCode}",
            message: "RegistrationError.",
            details: '${response.data['message']}');
      }
    } catch (e) {
      errorMessage = errorMessage!.isEmpty ? e.toString() : errorMessage;
      throw Exception(errorMessage);
    }
  }

  @override
  Future changePassWord(
      NewPasswordRequest changePasswordRequest, int idUser) async {
    String? errorMessage = '';
    try {
      final client = NetworkUtil.getTokenClient();

      final response = await client.patch('accounts/$idUser/password',
          data: changePasswordRequest.toJson());
      if (response.statusCode! >= 400) {
        if (response.data is String?) {
          errorMessage = response.data;
        } else {
          errorMessage = _getErrorMessage(response.data);
        }

        throw PlatformException(
            code: "${response.statusCode}",
            message: "ChangePasswordError.",
            details: errorMessage);
      }
    } catch (e) {
      throw Exception(errorMessage!.isEmpty ? e.toString() : errorMessage);
    }
  }

  @override
  Future<bool> hasUserAlreadyLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString(NetworkUtil.AUTH_TOKEN_KEY!);
    final dateStr = prefs.getString(NetworkUtil.AUTH_TOKEN_DATE!);

    if (token == null && dateStr == null) {
      return false;
    }

    final date = DateTime.parse(dateStr!);
    final difference = date.difference(DateTime.now()).inDays;
    bool isValidToken = difference > -1 && difference < 3;
    if (isValidToken) {
      getCurrentLoggedUser();
    }
    return isValidToken;
  }

  @override
  Future<bool> updateUserInfo(UserResponse user) async {
    if (user == null || user.id == null)
      throw PlatformException(
          code: '400', details: 'editProfile.missingUpdateInformation');

    String? errorMessage = '';

    try {
      final client = NetworkUtil.getTokenClient();

      final response = await client.patch(
        'api/clients/${user.id}',
        data: user.toJson(),
      );

      if (response.statusCode! < 400) {
        final sharedPreferences = await SharedPreferences.getInstance();

        currentUser = user;

        final jsonData = jsonEncode(user.toJson());
        sharedPreferences.setString(SAVED_USER_KEY!, jsonData);

        return true;
      }

      errorMessage = response.data.toString();

      throw PlatformException(
          code: "${response.statusCode}",
          message: 'ErrorUpdatingUserInfo',
          details: '${response.data['message']}');
    } catch (e) {
      errorMessage = errorMessage!.isEmpty ? e.toString() : errorMessage;
      throw Exception(errorMessage);
    }
  }

  @override
  Future<int> getUserAge(UserResponse userResponse) async {
    try {
      String? birthday = userResponse.birthDate!.replaceAll('/', '-');
      if (birthday.isNotEmpty && DateTime.tryParse(birthday) != null) {
        final birth = DateTime.tryParse(birthday);

        final now = new DateTime.now();

        int years = now.year - birth!.year;
        int months = now.month - birth.month;
        int days = now.day - birth.day;

        if (months < 0 || (months == 0 && days < 0)) {
          years--;
          months += (days < 0 ? 11 : 12);
        }

        if (days < 0) {
          final monthAgo = new DateTime(now.year, now.month - 1, birth.day);
          days = now.difference(monthAgo).inDays + 1;
        }

        return years;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  @override
  List<StoreResponseModel> ageFilterStore(
      List<StoreResponseModel> list, int age) {
    List<StoreResponseModel> approved = <StoreResponseModel>[];

    if (age >= 15) {
      approved = list;
      return approved;
    }
    for (var i = 0; i < list.length; i++) {
      if (list[i].adultsOnly == false || list[i].adultsOnly == null) {
        approved.add(list[i]);
      }
    }
    return approved;
  }

  @override
  Future<ClientUser> getTempUser() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String? usr = sharedPreferences.getString(NetworkUtil.TEMP_USER_KEY!);

      ClientUser _user = ClientUser.fromJson(jsonDecode(usr!));
      return _user;
    } catch (e) {
      return ClientUser();
    }
  }
}

class GeneralError {
  String? message;
  DateTime? date = DateTime.now();
  GeneralError({required String message});
}

class UserAge {
  int years;
  int months;
  int days;
  UserAge({this.years = 0, this.months = 0, this.days = 0});
}
