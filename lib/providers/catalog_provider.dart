import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluidxtores/models/AllProducts.dart';
import 'package:fluidxtores/models/category_item.dart';
import 'package:fluidxtores/contracts/catalog_service_contract.dart';
import 'package:fluidxtores/models/Categories.dart';
import 'package:fluidxtores/models/productCategory.dart';

class CatalogProvider with ChangeNotifier {
  final CatalogServiceContract _service;
  int? productsCount = 0;
  bool? isLoading = false;
  AllCategories? categories;
  CategoryItem? aCategory;
  AllProducts? products;

  CatalogProvider(this._service);

  Future<AllCategories> getAllCategories() async {
    categories = await _service.getCategories();
    return categories!;
  }

  Future<CategoryItem> getACategory(int id) async {
    if (id != null) {
      CategoryItem aCategory2 = await _service.getCategory(id);
      return aCategory2;
    } else {
      return CategoryItem();
    }
  }

  Future<List<ProductCategory>> getProductCategories(int productid) async {
    List<ProductCategory> kategoryez =
        await _service.getProductCategories(productid);
    return kategoryez;
  }

  Future<AllProducts> getAllProducts() async {
    products = await _service.getProducts();
    //productsCount = await _service.getProductsCount();
    return products!;
  }

  Future<AllProducts> getPopularProducts() async {
    products = await _service.getAllPopularProducts();
    //productsCount = await _service.getProductsCount();
    return products!;
  }
}
