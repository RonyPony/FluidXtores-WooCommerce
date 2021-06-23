import 'package:flutter/widgets.dart';
import 'package:fluid/screens/cart/cart_screen.dart';
import 'package:fluid/screens/category/category_detail_screen.dart';
import 'package:fluid/screens/complete_profile/complete_profile_screen.dart';
import 'package:fluid/screens/details/details_screen.dart';
import 'package:fluid/screens/forgot_password/forgot_password_screen.dart';
import 'package:fluid/screens/home/home_screen.dart';
import 'package:fluid/screens/login_success/login_success_screen.dart';
import 'package:fluid/screens/notifications/notifications.dart';
import 'package:fluid/screens/otp/otp_screen.dart';
import 'package:fluid/screens/profile/profile_screen.dart';
import 'package:fluid/screens/search/search_screen.dart';
import 'package:fluid/screens/sign_in/sign_in_screen.dart';
import 'package:fluid/screens/splash/splash_screen.dart';
import 'package:fluid/screens/categories/categories_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/my_account/my_account_screen.dart';
import 'package:fluid/screens/user_info/userinfo_screen.dart';
import 'package:fluid/screens/notifications/notifications_setting.dart';
import 'package:fluid/screens/helpCenter/helpScreen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NotificationsScreen.routeName: (contex) => NotificationsScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  MyAccountScreen.routeName: (context) => MyAccountScreen(),
  UserInfoScreen.routeName: (context) => UserInfoScreen(),
  CategoryDetailScreen.routeName: (context) => CategoryDetailScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  NotificationsSettingScreen.routeName: (context) =>
      NotificationsSettingScreen(),
  HelpScreen.routeName: (context) => HelpScreen(),
};
