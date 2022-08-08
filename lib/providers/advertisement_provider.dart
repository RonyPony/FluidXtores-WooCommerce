import 'package:flutter/material.dart';
import 'package:fluidxtores/contracts/advertisementServiceContract.dart';

import '../models/FluidXstores_media.dart';

class AdvertisementProvider with ChangeNotifier {
  AdvertisementServiceContract _advertisementService;

  AdvertisementProvider(this._advertisementService);
  Future<List<String?>> getAllOffers() async {
    try {
      var result = await _advertisementService.getOffers();
      return result;
    } catch (e) {
      throw e;
    }
  }

  Future<List<fluidxtoresMedia>> getAll() async {
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
