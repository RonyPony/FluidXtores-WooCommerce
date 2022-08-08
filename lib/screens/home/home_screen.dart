import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluidxtores/components/coustom_bottom_nav_bar.dart';
import 'package:fluidxtores/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  void initialize() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.always ||
        permission != LocationPermission.whileInUse) {
      await Geolocator.requestPermission();
    }
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      //backgroundColor: kPrimaryColor.withOpacity(0.2),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
