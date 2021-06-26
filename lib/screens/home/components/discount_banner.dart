import 'dart:math';

import 'package:fluid/providers/advertisement_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    final _advertisementProvider = Provider.of<AdvertisementProvider>(context);
    Future<List<String>> offers = _advertisementProvider.getAllOffers();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final _random = Random();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (String item in snapshot.data)
                Container(
                  // height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    color: Colors
                            .primaries[_random.nextInt(Colors.primaries.length)]
                        [_random.nextInt(9) * 100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: "${item.split("|")[0]}\n"),
                        TextSpan(
                          text: removeAllHtmlTags(item.split("|")[1]),
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          );
          // return Container(
          //   // height: 90,
          //   width: double.infinity,
          //   margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          //   padding: EdgeInsets.symmetric(
          //     horizontal: getProportionateScreenWidth(20),
          //     vertical: getProportionateScreenWidth(15),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Color(0xFF4A3298),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Text.rich(
          //     TextSpan(
          //       style: TextStyle(color: Colors.white),
          //       children: [
          //         TextSpan(text: "A Summer Surpise\n"),
          //         TextSpan(
          //           text: "Cashback 20%",
          //           style: TextStyle(
          //             fontSize: getProportionateScreenWidth(24),
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        } else {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return Center(
              child: Text('No promo banners'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
      future: offers,
    );
  }
}
