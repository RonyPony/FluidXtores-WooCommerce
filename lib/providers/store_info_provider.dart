import 'package:fluidxtores/contracts/storeInfo_service_contract.dart';
import 'package:flutter/material.dart';

class StoreInfoProvider with ChangeNotifier {
  final StoreInfoServiceContract _serviceContract;
  bool? isClosed = false;
  String? storeLogoData;
  StoreInfoProvider(this._serviceContract);

  Future<bool> isStoreClosed() async {
    isClosed = await _serviceContract.isClosed();
    return isClosed!;
  }

  Future<String> getLogo() async {
    storeLogoData = await _serviceContract.getStoreLogo();
    return storeLogoData!;
  }
}
