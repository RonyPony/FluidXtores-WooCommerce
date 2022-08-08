
import '../models/FluidXstores_media.dart';

abstract class AdvertisementServiceContract {
  Future<List<fluidxtoresMedia>> getAllBanners();
  Future<List<String?>> getOffers();
}
