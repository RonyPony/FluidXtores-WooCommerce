import 'package:fluid/models/tags.dart';

class AllProducts {
  List<Products> products;

  AllProducts({this.products});

  AllProducts.fromJson(List<dynamic> json) {
    if (json != null) {
      products = new List<Products>();
      json.forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String name;
  int parent;
  String type;
  String variation;
  String permalink;
  String sku;
  String shortDescription;
  String description;
  bool onSale;
  Prices prices;
  String priceHtml;
  String averageRating;
  int reviewCount;
  List<Images> images;
  List<Categories> categories;
  List<Tags> tags;
  List<String> attributes;
  List<String> variations;
  bool hasOptions;
  bool isPurchasable;
  bool isInStock;
  bool isOnBackorder;
  Null lowStockRemaining;
  bool soldIndividually;
  int quantityLimit;
  AddToCart addToCart;

  Products(
      {this.id,
      this.name,
      this.parent,
      this.type,
      this.variation,
      this.permalink,
      this.sku,
      this.shortDescription,
      this.description,
      this.onSale,
      this.prices,
      this.priceHtml,
      this.averageRating,
      this.reviewCount,
      this.images,
      this.categories,
      this.tags,
      this.attributes,
      this.variations,
      this.hasOptions,
      this.isPurchasable,
      this.isInStock,
      this.isOnBackorder,
      this.lowStockRemaining,
      this.soldIndividually,
      this.quantityLimit,
      this.addToCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parent = json['parent'];
    type = json['type'];
    variation = json['variation'];
    permalink = json['permalink'];
    sku = json['sku'];
    shortDescription = json['short_description'];
    description = json['description'];
    onSale = json['on_sale'];
    prices =
        json['prices'] != null ? new Prices.fromJson(json['prices']) : null;
    priceHtml = json['price_html'];
    averageRating = json['average_rating'];
    reviewCount = json['review_count'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = new List<Null>();
      json['attributes'].forEach((v) {
        attributes.add(v);
      });
    }
    if (json['variations'] != null) {
      variations = new List<Null>();
      json['variations'].forEach((v) {
        variations.add(v);
      });
    }
    hasOptions = json['has_options'];
    isPurchasable = json['is_purchasable'];
    isInStock = json['is_in_stock'];
    isOnBackorder = json['is_on_backorder'];
    lowStockRemaining = json['low_stock_remaining'];
    soldIndividually = json['sold_individually'];
    quantityLimit = json['quantity_limit'];
    addToCart = json['add_to_cart'] != null
        ? new AddToCart.fromJson(json['add_to_cart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['type'] = this.type;
    data['variation'] = this.variation;
    data['permalink'] = this.permalink;
    data['sku'] = this.sku;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['on_sale'] = this.onSale;
    if (this.prices != null) {
      data['prices'] = this.prices.toJson();
    }
    data['price_html'] = this.priceHtml;
    data['average_rating'] = this.averageRating;
    data['review_count'] = this.reviewCount;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations.map((v) => v).toList();
    }
    data['has_options'] = this.hasOptions;
    data['is_purchasable'] = this.isPurchasable;
    data['is_in_stock'] = this.isInStock;
    data['is_on_backorder'] = this.isOnBackorder;
    data['low_stock_remaining'] = this.lowStockRemaining;
    data['sold_individually'] = this.soldIndividually;
    data['quantity_limit'] = this.quantityLimit;
    if (this.addToCart != null) {
      data['add_to_cart'] = this.addToCart.toJson();
    }
    return data;
  }
}

class Prices {
  String price;
  String regularPrice;
  String salePrice;
  Null priceRange;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  Prices(
      {this.price,
      this.regularPrice,
      this.salePrice,
      this.priceRange,
      this.currencyCode,
      this.currencySymbol,
      this.currencyMinorUnit,
      this.currencyDecimalSeparator,
      this.currencyThousandSeparator,
      this.currencyPrefix,
      this.currencySuffix});

  Prices.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    priceRange = json['price_range'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyMinorUnit = json['currency_minor_unit'];
    currencyDecimalSeparator = json['currency_decimal_separator'];
    currencyThousandSeparator = json['currency_thousand_separator'];
    currencyPrefix = json['currency_prefix'];
    currencySuffix = json['currency_suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['price_range'] = this.priceRange;
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_minor_unit'] = this.currencyMinorUnit;
    data['currency_decimal_separator'] = this.currencyDecimalSeparator;
    data['currency_thousand_separator'] = this.currencyThousandSeparator;
    data['currency_prefix'] = this.currencyPrefix;
    data['currency_suffix'] = this.currencySuffix;
    return data;
  }
}

class Categories {
  int id;
  String name;
  String slug;
  String link;

  Categories({this.id, this.name, this.slug, this.link});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['link'] = this.link;
    return data;
  }
}

class AddToCart {
  String text;
  String description;
  String url;

  AddToCart({this.text, this.description, this.url});

  AddToCart.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['description'] = this.description;
    data['url'] = this.url;
    return data;
  }
}

class LocalizedNames {
  int languageId;
  String localizedName;

  LocalizedNames({this.languageId, this.localizedName});

  LocalizedNames.fromJson(Map<String, dynamic> json) {
    languageId = json['language_id'];
    localizedName = json['localized_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_id'] = this.languageId;
    data['localized_name'] = this.localizedName;
    return data;
  }
}

class Images {
  int productId;
  int pictureId;
  int position;
  String src;
  Null attachment;
  Null seoFilename;
  int id;

  Images(
      {this.productId,
      this.pictureId,
      this.position,
      this.src,
      this.attachment,
      this.seoFilename,
      this.id});

  Images.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    pictureId = json['picture_id'];
    position = json['position'];
    src = json['src'];
    attachment = json['attachment'];
    seoFilename = json['seoFilename'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['picture_id'] = this.pictureId;
    data['position'] = this.position;
    data['src'] = this.src;
    data['attachment'] = this.attachment;
    data['seoFilename'] = this.seoFilename;
    data['id'] = this.id;
    return data;
  }
}
