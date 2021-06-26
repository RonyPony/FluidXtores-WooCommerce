import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluid/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluid/contracts/authentication_service_contract.dart';
import 'package:fluid/contracts/user_service_contract.dart';
import 'package:fluid/models/change_password_request.dart';
import 'package:fluid/models/client_user.dart';
import 'package:fluid/models/new_password_request.dart';
import 'package:fluid/models/user_response.dart';
import 'package:flutter_woocommerce/flutter_woocommerce.dart';
import 'package:flutter_woocommerce/flutter_woocommerce_utils.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationServiceContract _authenticationService;
  UserServiceContract _userService;
  bool isUserLoggedIn = false;
  UserResponse loggedUser;
  int userAge;
  String nextRoute;

  AuthenticationProvider(this._authenticationService, this._userService);

  Future<bool> checkIfUserIsLoggingForTheFirstTime() async {
    final result = await _authenticationService.amountOfTimesUserHasLoggedIn();
    return result == 0;
  }

  Future<UserResponse> getCurrentUser() async {
    final res = await _authenticationService.getCurrentLoggedUser();
    loggedUser = res;
    return res;
  }

  Future<int> getUserAge(UserResponse user) async {
    final res = await _authenticationService.getUserAge(user);
    userAge = res;
    return res;
  }

  Future<UserResponse> authenticateUser(
      ClientUser user, bool rememberMe) async {
    try {
      final res = await _authenticationService.logInUser(user, rememberMe);
      if (res is WooAuthedUser) {
        FlutterWoocommerce x = FlutterWoocommerce(
            url: serverurl, consumerKey: apikey, consumerSecret: secret);
        var userData =
            await _authenticationService.searchUserByEmail(res.email, x);
        // res.firstName = userData[0]["name"];
        // res.id = userData[0]["id"];
        // res.profilePictureUrl = userData[0]["avatar_urls"]["24"];
        // res.rememberLogin = rememberMe;
        UserResponse finalUser = UserResponse(
          email: res.email,
          firstName: userData[0]["name"],
          isAuthenticated: true,
          rememberLogin: rememberMe,
        );
        loggedUser = finalUser;
        isUserLoggedIn = true;
        notifyListeners();
        return finalUser;
      } else {
        throw ("no valid info");
      }
    } catch (e) {
      loggedUser = null;
      isUserLoggedIn = false;
      notifyListeners();
      throw e;
    }
  }

  bool skipLogin() {
    try {
      final res = UserResponse();
      loggedUser = res;
      isUserLoggedIn = true;
      notifyListeners();
      return true;
    } catch (e) {
      loggedUser = null;
      isUserLoggedIn = false;
      notifyListeners();
      throw e;
    }
  }

  Future changePassword(
      NewPasswordRequest changePasswordRequest, int idUser) async {
    try {
      final res = await _authenticationService.changePassWord(
          changePasswordRequest, idUser);

      return res;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> updateUserProfileImage(FormData data, UserResponse user) async {
    return await _userService.updateClientUserProfileImage(data, user);
  }

  Future signOutUser() async {
    await _authenticationService.signOutUser();
    isUserLoggedIn = false;
    nextRoute = null;
    notifyListeners();
  }

  Future<String> register(ClientUser user) async {
    await validateUser(user);

    final registration = await _authenticationService.register(user);

    return registration;
  }

  Future validateUser(ClientUser user) async {
    if (user == null) {
      throw PlatformException(code: '400', message: "userCantBeNull");
    }

    final existsEmail = await _userService.existsEmail(user.email);
    if (existsEmail) {
      throw PlatformException(
          code: '400', message: "userWithEmailAlreadyExists");
    }

    final existsPhoneNumber =
        await _userService.existsPhoneNumber(user.phoneNumber);

    if (existsPhoneNumber) {
      throw PlatformException(
          code: '400', message: "userWithPhoneNumberAlreadyExists");
    }
  }

  Future resendConfirmationEmail(String customerId) async {
    try {
      await _authenticationService.resendConfirmationEmail(customerId);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> hasUserAlreadyLoggedIn() async {
    try {
      return await _authenticationService.hasUserAlreadyLoggedIn();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> validateEmail(String email) {
    return _userService.existsEmail(email);
  }

  Future<String> sendVerificationCode(String email) {
    return _userService.sendVerificationCode(email);
  }

  List<dynamic> ageFilterList(List<dynamic> list, int userAge) {
    return _authenticationService.ageFilterStore(list, userAge);
  }

  Future<bool> changeForgottenPassword(ChangePasswordRequest request) async {
    return await _userService.changeForgottenPassword(request);
  }

  Future<bool> updateUserInfo(UserResponse user) async {
    bool result = await _authenticationService.updateUserInfo(user);

    if (result) {
      final res = await _authenticationService.getCurrentLoggedUser();
      loggedUser = res;
      notifyListeners();
    }
    return result;
  }
}
