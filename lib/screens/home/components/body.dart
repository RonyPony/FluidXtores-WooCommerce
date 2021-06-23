import 'package:flutter/material.dart';
import 'package:fluid/screens/home/components/mainBanner.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';
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
            // FluidXstoreMedia
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(10)),
            AllCategoriesSection(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            AllProductsSection(),
          ],
        ),
      ),
    );
  }
}
