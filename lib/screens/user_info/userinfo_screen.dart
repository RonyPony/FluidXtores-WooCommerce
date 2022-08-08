import 'package:flutter/material.dart';
import 'package:fluidxtores/components/coustom_bottom_nav_bar.dart';
import 'package:fluidxtores/enums.dart';

import 'components/body.dart';

class UserInfoScreen extends StatelessWidget {
  static String routeName = "/UserInfoScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
