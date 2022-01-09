import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/constants.dart';
import 'package:fluid/screens/categories/components/top_rounded_container.dart';
import '../../../size_config.dart';
import 'user_info_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TopRoundedContainer(
        color: kPrimaryColor.withOpacity(0.1),
        child: Column(
          children: [
            Text(
                'Here you can see and modify your personal information, tap save after you are done.'),
            SizedBox(height: getProportionateScreenHeight(30)),
            UserInfoForm(),
            DefaultButton(
              text: "Go back",
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              press: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
