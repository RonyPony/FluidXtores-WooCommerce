import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluidxtores/providers/authentication_provider.dart';
import 'package:fluidxtores/screens/helpCenter/helpScreen.dart';
import 'package:fluidxtores/screens/notifications/notifications_setting.dart';
import 'package:fluidxtores/screens/sign_in/sign_in_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:fluidxtores/constants.dart';
import 'package:fluidxtores/screens/my_account/my_account_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    bool _loggedIn = authenticationProvider.isUserLoggedIn;
    String? name;
    String? lastName;
    if (_loggedIn) {
      name = authenticationProvider.loggedUser!.firstName;
      lastName = authenticationProvider.loggedUser!.lastName;
    } else {
      name = 'No';
      lastName = 'identificado';
    }
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          Text(
            '$name $lastName'.toUpperCase(),
            style:
                TextStyle(fontSize: 20, color: kPrimaryColor.withOpacity(0.5)),
          ),
          SizedBox(height: 20),
          _loggedIn
              ? ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {
                    Navigator.pushNamed(context, MyAccountScreen.routeName),
                  },
                )
              : SizedBox(),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.pushNamed(
                  context, NotificationsSettingScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, HelpScreen.routeName);
            },
          ),
          _loggedIn
              ? ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {
                    outForSure(context);
                  },
                )
              : ProfileMenu(
                  text: "Log In",
                  icon: "assets/icons/User Icon.svg",
                  press: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                ),
        ],
      ),
    );
  }
}

void outForSure(BuildContext context) {
  CoolAlert.show(
    context: context,
    backgroundColor: kPrimaryColor.withOpacity(0.4),
    barrierDismissible: true,
    confirmBtnText: 'Log Out',
    confirmBtnColor: kPrimaryColor,
    onConfirmBtnTap: () async {
      await Provider.of<AuthenticationProvider>(context, listen: false)
          .signOutUser();

      Navigator.of(context).pushNamedAndRemoveUntil(
          SignInScreen.routeName, (Route<dynamic> route) => false);
    },
    cancelBtnText: 'Cancel',
    showCancelBtn: true,
    title: 'Are you sure?',
    type: CoolAlertType.confirm,
    text: "Are you sure that you want to logout ?",
  );
}
