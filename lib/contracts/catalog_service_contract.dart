import 'package:fluid/models/AllProducts.dart';
import 'package:fluid/models/Categories.dart';
import 'package:fluid/models/category_item.dart';
import 'package:fluid/models/productCategories.dart';

abstract class CatalogServiceContract {
  Future<AllCategories> getCategories();
  Future<AllProducts> getProducts();

  Future<CategoryItem> getCategory(int id);

  Future<int> getProductsCount();

  Future<ProductCategories> getProductCategories(int productid) {}
}
