import 'package:flutter/material.dart';
import 'package:fluid/screens/categories/components/top_rounded_container.dart';
import 'package:fluid/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: SizeConfig.screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SafeArea(
                    child: TextField(
                      onChanged: (value) => print(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenWidth(9)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search products",
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ),
              Text(
                'Find Your ideal one',
                style: TextStyle(
                  fontSize: 27,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.blur_on_rounded,
                size: 400,
                color: kPrimaryColor.withOpacity(0.3),
              )
            ],
          )
        ],
      ),
    );
  }
}
