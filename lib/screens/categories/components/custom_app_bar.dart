import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluidxtores/constants.dart';
import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({required super.child, required super.preferredSize});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: ElevatedButton(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(60),
                // ),
                // color: Colors.white,
                // padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text('All Categories'),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.category,
                    color: kPrimaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
