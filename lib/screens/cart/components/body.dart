import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluidxtores/constants.dart';
import 'package:fluidxtores/helper/other_helpers.dart';
import 'package:fluidxtores/models/Cart.dart';
import 'package:fluidxtores/providers/cart_provider.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider =
        getProvider<ShoppingCartProvider>(listen: true, context: context);

    List<CartItem> shoppingCartItems = shoppingCartProvider.shoppingCartItems;

    return shoppingCartItems.length >= 1
        ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: shoppingCartItems.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(shoppingCartItems[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      shoppingCartItems.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(cart: shoppingCartItems[index]),
                ),
              ),
            ),
          )
        : Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                color: kPrimaryColor.withOpacity(0.3),
                size: 80,
              ),
              Center(
                child: Text(
                  'Ups!',
                  style: TextStyle(
                    fontSize: 30,
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'There is not products in your cart',
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(1),
                  ),
                ),
              )
            ],
          );
  }
}
