import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
  }) : super(key: key);
  final String? text;
  final Function press;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // color: kPrimaryColor,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return kPrimaryColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color:kPrimaryColor.withOpacity(.5))))
        ),
        onPressed:() {
          press();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon==null?SizedBox():icon,
            SizedBox(width: getProportionateScreenHeight(10),),
            Text(
              text!,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
