import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/models/category_item.dart';
import 'package:fluid/size_config.dart';

import 'category_description.dart';
import 'top_rounded_container.dart';
import 'category_image.dart';

class Body extends StatelessWidget {
  final CategoryItem category;
  const Body({Key key, @required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: ListView(
        children: [
          CategoryImage(category: category),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                CategoryDescription(
                  category: category,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Go Back",
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            press: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
