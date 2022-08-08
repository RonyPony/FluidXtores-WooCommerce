import 'package:fluidxtores/screens/allProducts/allProductsScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:fluidxtores/screens/category/category_detail_screen.dart';
import 'package:fluidxtores/screens/complete_profile/complete_profile_screen.dart';
import 'package:fluidxtores/screens/details/details_screen.dart';
import 'package:fluidxtores/screens/forgot_password/forgot_password_screen.dart';
import 'package:fluidxtores/screens/home/home_screen.dart';
import 'package:fluidxtores/screens/login_success/login_success_screen.dart';
import 'package:fluidxtores/screens/notifications/notifications.dart';
import 'package:fluidxtores/screens/otp/otp_screen.dart';
import 'package:fluidxtores/screens/profile/profile_screen.dart';
import 'package:fluidxtores/screens/search/search_screen.dart';
import 'package:fluidxtores/screens/sign_in/sign_in_screen.dart';
import 'package:fluidxtores/screens/splash/splash_screen.dart';
import 'package:fluidxtores/screens/categories/categories_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/my_account/my_account_screen.dart';
import 'package:fluidxtores/screens/user_info/userinfo_screen.dart';
import 'package:fluidxtores/screens/notifications/notifications_setting.dart';
import 'package:fluidxtores/screens/helpCenter/helpScreen.dart';

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
  AllProductsScreen.routeName: (context) => AllProductsScreen(),
};
