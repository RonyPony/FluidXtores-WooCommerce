
import 'package:dio/dio.dart';
import 'package:fluidxtores/models/Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluidxtores/contracts/advertisementServiceContract.dart';
import 'package:fluidxtores/helper/network_util.dart';

import '../models/FluidXstores_media.dart';

class AdvertisementService implements AdvertisementServiceContract {
  @override
  Future<List<fluidxtoresMedia>> getAllBanners() async {
    String? errorMessage = '';
    try {
      // String? apiName = EnvConfig.configs['userAuthenticationApiUrl'];
      // Dio dio = Dio();
      // dio.options.baseUrl = '${apiName}';
      // dio.options.connectTimeout = 20 * 3000;
      // dio.options.receiveTimeout = 30 * 3000;
      // dio.options.followRedirects = false;
      // dio.options.validateStatus = (status) {
      //   return status < 500;
      // };
      // dio.interceptors.add(_RequestInterceptor(dio: dio));
      // dio.interceptors
      //     .add(LogInterceptor(requestBody: true, responseBody: true));

      final client = NetworkUtil.getClient();
      final response = await client.get(
        'wp-json/wp/v2/media',
      );

      if (response.statusCode! >= 400) {
        errorMessage = (response.data);

        throw PlatformException(
            code: "${response.statusCode}",
            message: "getAllAdvertisementError.",
            details: '${response.data['message']}');
      }

      Map<String?, dynamic> foto1 = response.data[0];
      Image banner1 = Image(
        image: NetworkImage(foto1["guid"]["rendered"]),
      );
      var x = fluidxtoresMedia.fromJson(foto1);
      return <fluidxtoresMedia>[];
    } catch (e) {
      errorMessage = errorMessage!.isEmpty ? e.toString() : errorMessage;
      throw Exception(errorMessage);
    }
  }

  @override
  Future<List<String?>> getOffers() async {
    String? errorMessage = '';
    try {
      final client = NetworkUtil.getClient();
      final response = await client.get(
        'wp-json/wp/v2/pages',
      );

      if (response.statusCode! >= 400) {
        errorMessage = (response.data);

        throw PlatformException(
            code: "${response.statusCode}",
            message: "getAllAdvertisementError.",
            details: '${response.data['message']}');
      }
      List<dynamic> pl = response.data;
      List<WooPage> pages = [];
      pl.forEach((element) {
        WooPage pagina = WooPage.fromJson((element));
        pages.add(pagina);
      });
      List<String?> offerts = [];
      pages.forEach((element) {
        if (isOffer(element.title!.rendered)) {
          var title = element.title!.rendered!.split("|");
          offerts.add('${title[1]}|${element.content!.rendered}');
        }
      });
      return offerts;
    } catch (e) {
      errorMessage = errorMessage!.isEmpty ? e.toString() : errorMessage;
      throw Exception(errorMessage);
    }
  }
}

bool isOffer(String? pageName) {
  if (pageName!.contains("offer-")) {
    return true;
  } else {
    return false;
  }
}

class _RequestInterceptor extends InterceptorsWrapper {
  final Dio dio;
  String? username;
  String? password;

  _RequestInterceptor({required this.dio, this.username, this.password});

  @override
  Future InterceptorsWrapper(RequestOptions options) async {
    dio.lock();
    final token = await _getApiToken();
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['Accept'] = 'application/json';
    dio.unlock();
    return options;
  }

  Future<String?> _getApiToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(NetworkUtil.AUTH_TOKEN_KEY!);
    final dateStr = sharedPreferences.getString(NetworkUtil.AUTH_TOKEN_DATE!);
    if (token == null && dateStr == null) {
      throw new PlatformException(message: 'Token expired', code: '401');
    }

    final date = DateTime.parse(dateStr!);
    final difference = date.difference(DateTime.now()).inDays;
    if (difference > 2 || difference < -1)
      throw new PlatformException(message: 'Token expired', code: '401');

    return token;
  }
}
