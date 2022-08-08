import 'package:fluidxtores/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = "/Categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(preferredSize: MediaQuery.of(context).size,child: SizedBox(),),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
