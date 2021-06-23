import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';
class CategoriesScreen extends StatelessWidget {
  static String routeName = "/Categories";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}
