import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluid/models/AllProducts.dart';
import 'package:fluid/models/category_item.dart';
import 'package:fluid/contracts/catalog_service_contract.dart';
import 'package:fluid/models/Categories.dart';
import 'package:fluid/models/productCategories.dart';

class CatalogProvider with ChangeNotifier {
  final CatalogServiceContract _service;
  int productsCount = 0;
  bool isLoading = false;
  AllCategories categories;
  CategoryItem aCategory;
  AllProducts products;

  CatalogProvider(this._service);

  Future<AllCategories> getAllCategories() async {
    categories = await _service.getCategories();
    return categories;
  }

  Future<CategoryItem> getACategory(int id) async {
    CategoryItem aCategory2 = await _service.getCategory(id);
    return aCategory2;
  }

  Future<ProductCategories> getProductCategories(int productid) async {
    ProductCategories aCategory3 =
        await _service.getProductCategories(productid);
    return aCategory3;
  }

  Future<AllProducts> getAllProducts() async {
    products = await _service.getProducts();
    //productsCount = await _service.getProductsCount();
    return products;
  }
}
