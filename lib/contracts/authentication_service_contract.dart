import 'package:fluidxtores/models/client_user.dart';
import 'package:fluidxtores/models/new_password_request.dart';
import 'package:fluidxtores/models/store.dart';
import 'package:fluidxtores/models/user_response.dart';

import '../models/authUser.dart';
import '../models/user_login_response.dart';

abstract class AuthenticationServiceContract {
  Future<int> amountOfTimesUserHasLoggedIn();

  Future<UserResponse> getCurrentLoggedUser();

  Future<dynamic> logInUser(ClientUser user, bool remember);

  Future<dynamic> searchUserByEmail(
      String? email);
  Future changePassWord(NewPasswordRequest changePasswordRequest, int idUser);

  Future<String?> register(ClientUser user);

  Future signOutUser();

  Future<int> getUserAge(UserResponse user);

  List<StoreResponseModel> ageFilterStore(
      List<StoreResponseModel> list, int userAge);

  Future resendConfirmationEmail(String? customerId);

  Future<bool> hasUserAlreadyLoggedIn();

  Future<bool> updateUserInfo(UserResponse user);

  void saveTempUser(ClientUser user);

  Future<ClientUser> getTempUser();
}
