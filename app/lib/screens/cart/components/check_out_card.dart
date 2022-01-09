import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/helper/other_helpers.dart';
import 'package:fluid/models/Cart.dart';
import 'package:fluid/providers/cart_provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider =
        getProvider<ShoppingCartProvider>(listen: true, context: context);

    List<CartItem> shoppingCartItems = shoppingCartProvider.shoppingCartItems;
    double cartTotal = shoppingCartProvider.totalAmount;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/receipt.svg",
                    color: kPrimaryColor,
                  ),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$$cartTotal",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    icon: Icon(
                      Icons.playlist_add_check_sharp,
                      color: Colors.white,
                    ),
                    text: "Check Out",
                    press: () {
                      if (shoppingCartItems.length <= 0) {
                        CoolAlert.show(
                          context: context,
                          backgroundColor: kPrimaryColor,
                          barrierDismissible: true,
                          confirmBtnText: 'Ok',
                          confirmBtnColor: kPrimaryColor,
                          animType: CoolAlertAnimType.slideInUp,
                          title: 'Hey!',
                          type: CoolAlertType.warning,
                          text:
                              "First you have to add some products to the cart to complete an order.",
                        );
                      } else {}
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
