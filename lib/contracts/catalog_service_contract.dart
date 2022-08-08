import 'package:fluidxtores/models/AllProducts.dart';
import 'package:fluidxtores/models/Categories.dart';
import 'package:fluidxtores/models/category_item.dart';
import 'package:fluidxtores/models/productCategory.dart';

abstract class CatalogServiceContract {
  Future<AllCategories> getCategories();
  Future<AllProducts> getProducts();
  Future<AllProducts> getAllPopularProducts();
  Future<CategoryItem> getCategory(int id);

  Future<int> getProductsCount();

  Future<List<ProductCategory>> getProductCategories(int productid);
}
