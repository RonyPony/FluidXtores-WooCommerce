import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/constants.dart';
import 'package:fluid/helper/other_helpers.dart';
import 'package:fluid/models/Product.dart';
import 'package:fluid/providers/authentication_provider.dart';
import 'package:fluid/providers/cart_provider.dart';
import 'package:fluid/screens/cart/cart_screen.dart';
import 'package:fluid/screens/sign_in/sign_in_screen.dart';
import 'package:fluid/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: kPrimaryColor.withOpacity(0.1),
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text(product.title),
                        content: SingleChildScrollView(
                            child: Html(data: product.fullDescription))),
                  );
                },
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: Column(
                          children: [
                            DefaultButton(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              text: "Add To Cart",
                              press: () {
                                var shoppingCartProvider =
                                    getProvider<ShoppingCartProvider>(
                                        listen: false, context: context);

                                shoppingCartProvider.addProductToCart(
                                    product, 1);
                                CoolAlert.show(
                                  title:
                                      '${product.title} has been added to your cart.',
                                  context: context,
                                  type: CoolAlertType.success,
                                  confirmBtnText: 'Go to cart',
                                  confirmBtnColor: kPrimaryColor,
                                  animType: CoolAlertAnimType.slideInUp,
                                  onConfirmBtnTap: () {
                                    Navigator.pushNamed(
                                        context, CartScreen.routeName);
                                  },
                                  cancelBtnText: 'Ok',
                                  showCancelBtn: true,
                                  borderRadius: 50,
                                  backgroundColor: kPrimaryColor,
                                );
                              },
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            DefaultButton(
                              icon: Icon(
                                Icons.payments_outlined,
                                color: Colors.white,
                              ),
                              text: 'Buy it now',
                              press: () {
                                var authProvider =
                                    getProvider<AuthenticationProvider>(
                                        context: context, listen: false);
                                if (authProvider.isUserLoggedIn) {
                                  CoolAlert.show(
                                    title:
                                        'Cool, now ${product.title} is yours, you will get it soon',
                                    context: context,
                                    type: CoolAlertType.success,
                                    confirmBtnText: 'Ok',
                                    confirmBtnColor: kPrimaryColor,
                                    animType: CoolAlertAnimType.slideInUp,
                                    onConfirmBtnTap: () {
                                      Navigator.pop(context);
                                    },
                                    borderRadius: 50,
                                    backgroundColor: kPrimaryColor,
                                  );
                                } else {
                                  Navigator.pushNamed(
                                      context, SignInScreen.routeName);
                                }
                              },
                            )
                          ],
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
    );
  }
}
