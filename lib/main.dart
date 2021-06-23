import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:fluid/providers/advertisement_provider.dart';
import 'package:fluid/providers/authentication_provider.dart';
import 'package:fluid/providers/cart_provider.dart';
import 'package:fluid/routes.dart';
import 'package:fluid/screens/splash/splash_screen.dart';
import 'package:fluid/services/address_service.dart';
import 'package:fluid/services/advertisement_service.dart';
import 'package:fluid/services/authentication_service.dart';
import 'package:fluid/theme.dart';
import 'package:fluid/providers/catalog_provider.dart';
import 'package:fluid/services/catalog_service.dart';
import 'services/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                AuthenticationProvider(AuthenticationService(), UserService()),
          ),
          ChangeNotifierProvider(
            create: (context) => CatalogProvider(CatalogService()),
          ),
          ChangeNotifierProvider(
            create: (context) => AdvertisementProvider(AdvertisementService()),
          ),
          ChangeNotifierProvider(
              create: (context) => ShoppingCartProvider(
                  AuthenticationService(), AddressService())),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Stores',
            theme: theme(),
            initialRoute: SplashScreen.routeName,
            routes: routes,
            builder: EasyLoading.init(),
          ),
        ));
  }
}
