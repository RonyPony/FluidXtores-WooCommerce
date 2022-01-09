import 'package:flutter/material.dart';
import 'package:fluid/components/coustom_bottom_nav_bar.dart';
import 'package:fluid/constants.dart';
import 'package:fluid/enums.dart';
import 'package:fluid/screens/search/components/search_field.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";

  void initialize() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.search),
    );
  }
}
