import 'package:fluid/components/coustom_bottom_nav_bar.dart';
import 'package:fluid/constants.dart';
import 'package:fluid/screens/home/components/allProducts.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class AllProductsScreen extends StatefulWidget {
  AllProductsScreen({Key key}) : super(key: key);
  static String routeName = "/AllproductScreen";
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'All Products',
          style: TextStyle(color: kPrimaryLightColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [AllProductsSection()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
