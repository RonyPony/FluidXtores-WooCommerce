import 'package:fluid/models/FluidXstores_media.dart';

abstract class AdvertisementServiceContract {
  Future<List<FluidXstoreMedia>> getAllBanners();
  Future<List<String>> getOffers();
}
