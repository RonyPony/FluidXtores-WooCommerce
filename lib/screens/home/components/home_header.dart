import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluidxtores/helper/other_helpers.dart';
import 'package:fluidxtores/models/Cart.dart';
import 'package:fluidxtores/providers/cart_provider.dart';
import 'package:fluidxtores/screens/cart/cart_screen.dart';
import 'package:fluidxtores/screens/notifications/notifications.dart';

import '../../../providers/store_info_provider.dart';
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
    var storeInfoProvider =
        getProvider<StoreInfoProvider>(listen: false, context: context);
    Future<String> logoData = storeInfoProvider.getLogo();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: logoData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Cargando...");
                  }
                  if (snapshot.hasError) {
                    return Text("Please try again");
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Image(
                        height: 100,
                        image:
                            Image.memory(base64Decode(snapshot.data.toString()))
                                .image
                        // NetworkImage(
                        //     //'https://brandslogos.com/wp-content/uploads/images/large/levis-logo-3.png'
                        //     'https://vaporescrew.cl/wp-content/uploads/2019/05/LogoWeb.png'
                        //     )
                        );
                  } else {
                    return Text("No Info");
                  }
                },
              )
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
