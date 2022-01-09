import 'package:flutter/material.dart';
import 'package:fluid/contracts/advertisementServiceContract.dart';
import 'package:fluid/models/FluidXstores_media.dart';

class AdvertisementProvider with ChangeNotifier {
  AdvertisementServiceContract _advertisementService;

  AdvertisementProvider(this._advertisementService);
  Future<List<String>> getAllOffers() async {
    try {
      var result = await _advertisementService.getOffers();
      return result;
    } catch (e) {
      throw e;
    }
  }

  Future<List<FluidXstoreMedia>> getAll() async {
    try {
      var result = await _advertisementService.getAllBanners();
      notifyListeners();

      return result;
    } catch (e) {
      notifyListeners();

      throw e;
    }
  }
}
