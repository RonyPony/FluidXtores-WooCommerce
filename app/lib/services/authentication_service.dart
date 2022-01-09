import 'dart:convert';
import 'dart:io';
import 'package:fluid/constants.dart';
import 'package:fluid/models/reques_response.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluid/contracts/authentication_service_contract.dart';
import 'package:fluid/helper/network_util.dart';
import 'package:fluid/models/client_user.dart';
import 'package:fluid/models/new_password_request.dart';
import 'package:http/http.dart' as http;
import 'package:fluid/models/store.dart';
import 'package:fluid/models/token_response.dart';
import 'package:fluid/models/user_response.dart';
import 'package:flutter_woocommerce/flutter_woocommerce.dart';
import 'package:flutter_woocommerce/flutter_woocommerce_utils.dart';

class AuthenticationService implements AuthenticationServiceContract {
  static const String AUTHENTICATION_NUMBER_KEY =
      'amountOfTimesUserHasAuthenticated';
  static UserResponse currentUser;
  static const String SAVED_USER_KEY = 'savedUserForAgrimensorLogin';

  @override
  Future<int> amountOfTimesUserHasLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(AUTHENTICATION_NUMBER_KEY)) {
      return sharedPreferences.getInt(AUTHENTICATION_NUMBER_KEY);
    }
    return 0;
  }

  @override
  Future<UserResponse> getCurrentLoggedUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (currentUser != null) {
      return currentUser;
    }
    final savedUserJson = sharedPreferences.getString(SAVED_USER_KEY);
    if (savedUserJson != null && savedUserJson.isNotEmpty) {
      final decodedJson = jsonDecode(savedUserJson);
      currentUser = UserResponse.fromJson(decodedJson);
      return currentUser;
    }
    return null;
  }

  void saveTempUser(ClientUser _user) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      String usr = jsonEncode(_user.toJson());

      sharedPreferences.setString(NetworkUtil.TEMP_USER_KEY, usr);
    } catch (e) {}
  }

  Future<dynamic> loginRequest(User user, FlutterWoocommerce wooInfo) async {
    if (user.username == null) {
      return WooError(message: "Username is empty");
    } else if (user.password == null) {
      return WooError(message: "Password is empty");
    }
    String host = wooInfo.url;
    if (!host.endsWith('/')) host += "/";
    String url = host + 'wp-json/jwt-auth/v1/token';

    var response = await http.post(url,
        body: {"username": user.username, "password": user.password});
    var dataResponse = await json.decode(response.body);
    if (dataResponse['message'] != null) {
      return RequestResponse.fromJSON(dataResponse);
    } else {
      return WooAuthedUser.fromJSON(dataResponse);
    }
  }

  @override
  Future<dynamic> searchUserByEmail(
      String email, FlutterWoocommerce requestInfo) async {
    String host = requestInfo.url;
    if (!host.endsWith('/')) host += "/";
    String url = host + 'wp-json/wp/v2/users/?search=$email';

    var response = await http
        .get(url, headers: {HttpHeaders.contentTypeHeader: "application/json"});
    var dataResponse = await json.decode(response.body);
    print(dataResponse);
    return dataResponse;
  }

  @override
  Future<WooAuthedUser> logInUser(ClientUser user, bool remember) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    FlutterWoocommerce flutterWoocommerce = FlutterWoocommerce(
        url: serverurl, consumerKey: apikey, consumerSecret: secret);
    var result = await loginRequest(
        User(username: user.email, password: user.password),
        flutterWoocommerce);
    if (result is WooAuthedUser) {
      if (remember) {
        getCurrentLoggedUser();
        final jsonData = jsonEncode(currentUser.toJson());
        sharedPreferences.setString(SAVED_USER_KEY, jsonData);
      } else {
        await sharedPreferences.remove(SAVED_USER_KEY);
      }
      await _incrementNumberOfLogins();
      return result;
    } else {
      print('error');
    }

    return null;

    // if (result is! WooError) {
    //   RequestResponse wooAuthedUser = result;
    //   print(wooAuthedUser.message);
    // } else {
    //   WooError err = result;
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
    // } // String responseMessage = '';
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
    if (sharedPreferences.containsKey(AUTHENTICATION_NUMBER_KEY)) {
      sharedPreferences.setInt(AUTHENTICATION_NUMBER_KEY, 1);
    } else {
      final val = sharedPreferences.getInt(AUTHENTICATION_NUMBER_KEY) ?? 0;
      sharedPreferences.setInt(AUTHENTICATION_NUMBER_KEY, val + 1);
    }
  }

  @override
  Future signOutUser() async {
    currentUser = null;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(NetworkUtil.AUTH_TOKEN_KEY);
    sharedPreferences.remove(NetworkUtil.AUTH_TOKEN_DATE);
  }

  @override
  Future<String> register(ClientUser user) async {
    String errorMessage = '';
    try {
      final client = NetworkUtil.getClient();

      final response = await client.post('clients', data: user.toJson());

      if (response.statusCode < 400) {
        return response.data['CustomerId'].toString();
      }

      errorMessage = _getErrorMessage(response.data);

      throw PlatformException(
          code: "${response.statusCode}",
          message: "RegistrationError.",
          details: '${response.data['message']}');
    } catch (e) {
      errorMessage = errorMessage.isEmpty ? e.message : errorMessage;
      throw Exception(errorMessage);
    }
  }

  String _getErrorMessage(Map<String, dynamic> jsonModel) {
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
  Future resendConfirmationEmail(String customerId) async {
    String errorMessage = '';
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
      errorMessage = errorMessage.isEmpty ? e.message : errorMessage;
      throw Exception(errorMessage);
    }
  }

  @override
  Future changePassWord(
      NewPasswordRequest changePasswordRequest, int idUser) async {
    String errorMessage = '';
    try {
      final client = NetworkUtil.getTokenClient();

      final response = await client.patch('accounts/$idUser/password',
          data: changePasswordRequest.toJson());
      if (response.statusCode >= 400) {
        if (response.data is String) {
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
      throw Exception(errorMessage.isEmpty ? e.message : errorMessage);
    }
  }

  @override
  Future<bool> hasUserAlreadyLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString(NetworkUtil.AUTH_TOKEN_KEY);
    final dateStr = prefs.getString(NetworkUtil.AUTH_TOKEN_DATE);

    if (token == null && dateStr == null) {
      return false;
    }

    final date = DateTime.parse(dateStr);
    final difference = date.difference(DateTime.now()).inDays;
    bool isValidToken = difference > -1 && difference < 3;
    if (isValidToken) {
      getCurrentLoggedUser();
    }
    return isValidToken;
  }

  @override
  Future<bool> updateUserInfo(UserResponse user) async {
    if (user == null || user?.id == null)
      throw PlatformException(
          code: '400', details: 'editProfile.missingUpdateInformation');

    String errorMessage = '';

    try {
      final client = NetworkUtil.getTokenClient();

      final response = await client.patch(
        'api/clients/${user.id}',
        data: user.toJson(),
      );

      if (response.statusCode < 400) {
        final sharedPreferences = await SharedPreferences.getInstance();

        currentUser = user;

        final jsonData = jsonEncode(user.toJson());
        sharedPreferences.setString(SAVED_USER_KEY, jsonData);

        return true;
      }

      errorMessage = response.data.toString();

      throw PlatformException(
          code: "${response.statusCode}",
          message: 'ErrorUpdatingUserInfo',
          details: '${response.data['message']}');
    } catch (e) {
      errorMessage = errorMessage.isEmpty ? e.message : errorMessage;
      throw Exception(errorMessage);
    }
  }

  @override
  Future<int> getUserAge(UserResponse userResponse) async {
    try {
      String birthday = userResponse.birthDate.replaceAll('/', '-');
      if (birthday.isNotEmpty && DateTime.tryParse(birthday) != null) {
        final birth = DateTime.tryParse(birthday);

        final now = new DateTime.now();

        int years = now.year - birth.year;
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
    List<StoreResponseModel> approved = List<StoreResponseModel>();

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
      String usr = sharedPreferences.getString(NetworkUtil.TEMP_USER_KEY);

      ClientUser _user = ClientUser.fromJson(jsonDecode(usr));
      return _user;
    } catch (e) {
      return null;
    }
    {}
  }
}

class UserAge {
  int years;
  int months;
  int days;
  UserAge({this.years = 0, this.months = 0, this.days = 0});
}
