import 'package:flutter/material.dart';
import 'package:fluid/components/coustom_bottom_nav_bar.dart';
import 'package:fluid/enums.dart';

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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
