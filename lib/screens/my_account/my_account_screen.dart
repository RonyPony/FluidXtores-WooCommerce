import 'package:fluidxtores/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:fluidxtores/components/coustom_bottom_nav_bar.dart';
import 'package:fluidxtores/enums.dart';

import 'components/body.dart';

class MyAccountScreen extends StatelessWidget {
  static String routeName = "/MyAccountScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: Body(),
      bottomSheet: DefaultButton(
        text: "Go back",
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
        press: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
