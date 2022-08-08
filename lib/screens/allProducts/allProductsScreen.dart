import 'package:fluidxtores/components/coustom_bottom_nav_bar.dart';
import 'package:fluidxtores/constants.dart';
import 'package:fluidxtores/screens/home/components/allProducts.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class AllProductsScreen extends StatefulWidget {
  AllProductsScreen({Key? key}) : super(key: key);
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
