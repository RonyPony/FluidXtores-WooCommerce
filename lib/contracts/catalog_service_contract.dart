import 'package:fluid/models/AllProducts.dart';
import 'package:fluid/models/Categories.dart';
import 'package:fluid/models/category_item.dart';
import 'package:fluid/models/productCategory.dart';

abstract class CatalogServiceContract {
  Future<AllCategories> getCategories();
  Future<AllProducts> getProducts();
  Future<AllProducts> getAllPopularProducts();
  Future<CategoryItem> getCategory(int id);

  Future<int> getProductsCount();

  Future<List<ProductCategory>> getProductCategories(int productid) {
    {}
  }
}
