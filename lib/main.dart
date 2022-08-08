import 'package:fluidxtores/providers/advertisement_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluidxtores/providers/authentication_provider.dart';
import 'package:fluidxtores/providers/cart_provider.dart';
import 'package:fluidxtores/routes.dart';
import 'package:fluidxtores/screens/splash/splash_screen.dart';
import 'package:fluidxtores/services/address_service.dart';
import 'package:fluidxtores/services/advertisement_service.dart';
import 'package:fluidxtores/services/authentication_service.dart';
import 'package:fluidxtores/theme.dart';
import 'package:fluidxtores/providers/catalog_provider.dart';
import 'package:fluidxtores/services/catalog_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
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
