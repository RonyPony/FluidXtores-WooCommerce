import 'package:fluid/constants.dart';
import 'package:fluid/models/AllProducts.dart';
import 'package:fluid/providers/catalog_provider.dart';
import 'package:fluid/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluid/components/product_card.dart';
import 'package:fluid/models/Product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<CatalogProvider>(context);
    Future<AllProducts> _popularProducts =
        productsProvider.getPopularProducts();
    return FutureBuilder<AllProducts>(
        future: _popularProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: SectionTitle(
                    title: 'Popular Products',
                    press: () {},
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...snapshot.data.products
                          .map((e) => buildProductCard(context, e))
                          .toList(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Loading Popular Products',
                  style: TextStyle(color: kPrimaryColor),
                )
              ],
            );
          }
        });
    // return Column(
    //   children: [
    //     Padding(
    //       padding:
    //           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //       child: SectionTitle(title: "Popular Products", press: () {}),
    //     ),
    //     SizedBox(height: getProportionateScreenWidth(20)),
    //     SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           ...List.generate(
    //             demoProducts.length,
    //             (index) {
    //               if (demoProducts[index].isPopular)
    //                 return ProductCard(
    //                   product: demoProducts[index],
    //                   isImageUrl: false,
    //                 );

    //               return SizedBox
    //                   .shrink(); // here by default width and height is 0
    //             },
    //           ),
    //           SizedBox(width: getProportionateScreenWidth(20)),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }

  buildProductCard(BuildContext context, Products product) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: GestureDetector(
          onTap: () {
//  Navigator.pushNamed(
//             context,
//             DetailsScreen.routeName,
//             arguments: ProductDetailsArguments(product: product),)
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image(
                        height: 200,
                        image: NetworkImage(product.images[0].src)),
                    //child:isImageUrl ? Image.asset(product.images[0]):Image(image: NetworkImage(product.images[0]),),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.prices.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: true //product.isFavourite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: true //product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
