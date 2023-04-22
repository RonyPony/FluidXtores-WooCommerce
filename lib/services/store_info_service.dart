import 'package:fluidxtores/contracts/storeInfo_service_contract.dart';
import 'package:fluidxtores/models/storeInfo.dart';
import 'package:fluidxtores/models/store_info.dart';
import 'package:flutter/services.dart';

import '../helper/network_util.dart';

class StoreInfoService implements StoreInfoServiceContract {
  @override
  Future<String> getStoreLogo() async {
    Future<StoreInfo> categories;
    try {
      final client = NetworkUtil.getClient();

      final response = await client.get('current_store');
      if (response.statusCode! < 400) {
        StoreInfo ex = StoreInfo.fromJson(response.data);
        return ex.stores!.first.logo!;
      } else {
        throw PlatformException(
            code: "${response.statusCode}", message: "invalidEmail");
      }
    } catch (e) {
      throw Exception('error');
    }
  }

  @override
  Future<bool> isClosed() {
    // TODO: implement isClosed
    throw UnimplementedError();
  }
}
