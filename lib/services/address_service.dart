import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluidxtores/contracts/address_service_contract.dart';
import 'package:fluidxtores/models/client_address.dart';

class AddressService implements AddressServiceContract {
  static const String? SAVED_USER_ADRESS_KEY = 'selectedAddressForRegister';
  @override
  Future<ClientAddress> getSelectedAddress() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedUserJson = sharedPreferences.getString(SAVED_USER_ADRESS_KEY!);
    if (savedUserJson != null) {
      final decodedJson = jsonDecode(savedUserJson);
      final address = ClientAddress.fromGoogleMapJson(decodedJson);
      return address;
    } else {
      return ClientAddress();
    }
  }

  @override
  Future<ClientAddress> saveSelectedAddress(Map data) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonData = jsonEncode(data);
    await sharedPreferences.setString(SAVED_USER_ADRESS_KEY!, jsonData);

    final decodedJson = jsonDecode(jsonData);
    final address = ClientAddress.fromGoogleMapJson(decodedJson);
    return address;
  }
}
