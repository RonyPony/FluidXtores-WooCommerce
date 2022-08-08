import 'package:flutter/material.dart';
import 'package:fluidxtores/components/default_button.dart';
import 'package:fluidxtores/constants.dart';
import 'package:fluidxtores/screens/home/home_screen.dart';
import 'package:fluidxtores/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight! * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        Text(
          "Hey!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        Text("It's great to have you here!"),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: DefaultButton(
            text: "Take me home",
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
