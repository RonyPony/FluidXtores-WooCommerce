import 'package:flutter/material.dart';
import 'package:fluidxtores/constants.dart';
import 'package:fluidxtores/screens/categories/components/top_rounded_container.dart';
import 'package:fluidxtores/screens/profile/components/profile_menu.dart';
import 'package:fluidxtores/screens/user_info/userinfo_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TopRoundedContainer(
        color: kPrimaryColor.withOpacity(0.2),
        child: Column(
          children: [
            Center(
              child: Text('My account screen'),
            ),
            ProfileMenu(
              text: "My info",
              icon: "assets/icons/User.svg",
              press: () {
                Navigator.pushNamed(context, UserInfoScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
