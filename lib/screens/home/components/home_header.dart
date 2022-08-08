import 'package:flutter/material.dart';
import 'package:fluidxtores/helper/other_helpers.dart';
import 'package:fluidxtores/models/Cart.dart';
import 'package:fluidxtores/providers/cart_provider.dart';
import 'package:fluidxtores/screens/cart/cart_screen.dart';
import 'package:fluidxtores/screens/notifications/notifications.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider =
        getProvider<ShoppingCartProvider>(listen: true, context: context);
    List<CartItem> shoppingCartItems = shoppingCartProvider.shoppingCartItems;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 100,
                  image: AssetImage('assets/images/fedex-express.png')
                  // NetworkImage(
                  //     //'https://brandslogos.com/wp-content/uploads/images/large/levis-logo-3.png'
                  //     'https://vaporescrew.cl/wp-content/uploads/2019/05/LogoWeb.png'
                  //     )
                  ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchField(),
              IconBtnWithCounter(
                svgSrc: "assets/icons/Cart Icon.svg",
                numOfitem: shoppingCartItems.length,
                press: () => Navigator.pushNamed(context, CartScreen.routeName),
              ),
              IconBtnWithCounter(
                svgSrc: "assets/icons/Bell.svg",
                numOfitem: 3,
                press: () {
                  Navigator.pushNamed(context, NotificationsScreen.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
