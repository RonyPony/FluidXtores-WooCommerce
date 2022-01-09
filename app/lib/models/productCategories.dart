class ProductCategories {
  int productId;
  int categoryId;
  bool isFeaturedProduct;
  int displayOrder;
  int id;
  String entityCacheKey;

  ProductCategories(
      {this.productId,
      this.categoryId,
      this.isFeaturedProduct,
      this.displayOrder,
      this.id,
      this.entityCacheKey});

  ProductCategories.fromJson(Map<String,dynamic>json) {
    productId = json['ProductId'];
    categoryId = json['CategoryId'];
    isFeaturedProduct = json['IsFeaturedProduct'];
    displayOrder = json['DisplayOrder'];
    id = json['Id'];
    entityCacheKey = json['EntityCacheKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['CategoryId'] = this.categoryId;
    data['IsFeaturedProduct'] = this.isFeaturedProduct;
    data['DisplayOrder'] = this.displayOrder;
    data['Id'] = this.id;
    data['EntityCacheKey'] = this.entityCacheKey;
    return data;
  }
}