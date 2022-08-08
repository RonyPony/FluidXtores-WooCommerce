import 'package:fluidxtores/screens/allProducts/allProductsScreen.dart';
import 'package:fluidxtores/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'allCategories.dart';
import 'allProducts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            // MainBanner(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            // fluidxtoresMedia
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(10)),
            AllCategoriesSection(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(
                title: "All Products",
                press: () {
                  Navigator.pushNamed(context, AllProductsScreen.routeName);
                },
              ),
            ),
            AllProductsSection(),
          ],
        ),
      ),
    );
  }
}
