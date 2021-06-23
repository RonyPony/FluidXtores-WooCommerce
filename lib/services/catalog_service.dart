import 'package:flutter/services.dart';
import 'package:fluid/helper/network_util.dart';
import 'package:fluid/contracts/catalog_service_contract.dart';
import 'package:fluid/models/AllProducts.dart';
import 'package:fluid/models/Categories.dart';
import 'package:fluid/models/category_item.dart';
import 'package:fluid/models/productCategories.dart';

class CatalogService implements CatalogServiceContract {
  @override
  Future<AllCategories> getCategories() async {
    Future<AllCategories> categories;
    try {
      final client = NetworkUtil.getClient();

      final response = await client.get('wp-json/wc/store/products/categories');
      if (response.statusCode < 400) {
        AllCategories ex = AllCategories.fromJson(response.data);
        return ex;
      } else {
        throw PlatformException(
            code: "${response.statusCode}", message: "invalidEmail");
      }
    } catch (e) {
      throw Exception('error');
    }
  }

  Future<AllProducts> getProducts() async {
    try {
      final client = NetworkUtil.getClient();

      final response = await client.get('wp-json/wc/store/products');
      if (response.statusCode < 400) {
        AllProducts ex = AllProducts.fromJson(response.data);
        return ex;
      } else {
        throw PlatformException(
            code: "${response.statusCode}", message: "Error occured");
      }
    } catch (e) {
      throw Exception('error');
    }
  }

  @override
  Future<CategoryItem> getCategory(int id) async {
    Future<CategoryItem> category;
    try {
      final client = NetworkUtil.getClient();

      final response =
          await client.get('wp-json/wc/store/products/categories/$id');
      if (response.statusCode < 400) {
        CategoryItem ex = CategoryItem.fromJson(response.data);
        return ex;
      } else {
        throw PlatformException(
            code: "${response.statusCode}", message: "error");
      }
    } catch (e) {
      throw Exception('error');
    }
  }

  @override
  Future<int> getProductsCount() async {
    try {
      final client = NetworkUtil.getClient();

      final response = await client.get('Products/count');
      if (response.statusCode < 400) {
        int ex = response.data['count'].toInt();
        return ex;
      } else {
        throw PlatformException(
            code: "${response.statusCode}", message: "invalidEmail");
      }
    } catch (e) {
      throw Exception('error');
    }
  }

  @override
  Future<ProductCategories> getProductCategories(int productid) async {
    try {
      final client = NetworkUtil.getTokenClient();
      final response = await client.get('categories/porproducto/$productid');
      if (response.statusCode < 400) {
        //ProductCategories ex = ProductCategories.fromJson(response.data);
        return response.data;
      } else {
        throw PlatformException(
            code: "${response.statusCode}", message: "error geting categories");
      }
    } catch (e) {
      throw Exception('error');
    }
  }
}
