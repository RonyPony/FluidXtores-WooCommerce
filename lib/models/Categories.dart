class AllCategories {
  List<Categories>? categories;

  AllCategories({this.categories});

  AllCategories.fromJson(List<dynamic> json) {
    if (json != null) {
      categories = <Categories>[];
      json.forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? name;
  List<LocalizedNames>? localizedNames;
  String? description;
  int? categoryTemplateId;
  String? metaKeywords;
  String? metaDescription;
  String? metaTitle;
  int? parentCategoryId;
  int? pageSize;
  String? pageSizeOptions;
  String? priceRanges;
  bool? showOnHomePage;
  bool? includeintopMenu;
  bool? hasDiscountsApplied;
  bool? published;
  bool? deleted;
  int? displayOrder;
  String? createdOnUtc;
  bool? allowCustomersToSelectPageSize;
  String? updatedOnUtc;
  List<int>? roleIds;
  List<int>? discountIds;
  List<int>? storeIds;
  Image? image;
  String? seName;
  int? id;

  Categories(
      {this.name,
      this.localizedNames,
      this.description,
      this.categoryTemplateId,
      this.metaKeywords,
      this.metaDescription,
      this.metaTitle,
      this.parentCategoryId,
      this.pageSize,
      this.pageSizeOptions,
      this.priceRanges,
      this.showOnHomePage,
      this.includeintopMenu,
      this.hasDiscountsApplied,
      this.published,
      this.deleted,
      this.displayOrder,
      this.createdOnUtc,
      this.allowCustomersToSelectPageSize,
      this.updatedOnUtc,
      this.roleIds,
      this.discountIds,
      this.storeIds,
      this.image,
      this.seName,
      this.id});

  Categories.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    if (json['localized_names'] != null) {
      localizedNames = <LocalizedNames>[];
      json['localized_names'].forEach((v) {
        localizedNames!.add(new LocalizedNames.fromJson(v));
      });
    }
    description = json['description'];
    categoryTemplateId = json['category_template_id'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    parentCategoryId = json['parent'];
    pageSize = json['page_size'];
    pageSizeOptions = json['page_size_options'];
    priceRanges = json['price_ranges'];
    showOnHomePage = json['show_on_home_page'];
    includeintopMenu = json['include_in_top_menu'];
    hasDiscountsApplied = json['has_discounts_applied'];
    published = json['published'];
    deleted = json['deleted'];
    displayOrder = json['display_order'];
    createdOnUtc = json['created_on_utc'];
    allowCustomersToSelectPageSize =
        json['allow_customers_to_select_page_size'];
    updatedOnUtc = json['updated_on_utc'];

    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    seName = json['se_name'];
    id = json['id'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    if (this.localizedNames != null) {
      data['localized_names'] =
          this.localizedNames!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['category_template_id'] = this.categoryTemplateId;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['meta_title'] = this.metaTitle;
    data['parent_category_id'] = this.parentCategoryId;
    data['page_size'] = this.pageSize;
    data['page_size_options'] = this.pageSizeOptions;
    data['price_ranges'] = this.priceRanges;
    data['show_on_home_page'] = this.showOnHomePage;
    data['include_in_top_menu'] = this.includeintopMenu;
    data['has_discounts_applied'] = this.hasDiscountsApplied;
    data['published'] = this.published;
    data['deleted'] = this.deleted;
    data['display_order'] = this.displayOrder;
    data['created_on_utc'] = this.createdOnUtc;
    data['allow_customers_to_select_page_size'] =
        this.allowCustomersToSelectPageSize;
    data['updated_on_utc'] = this.updatedOnUtc;

    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['se_name'] = this.seName;
    data['id'] = this.id;
    return data;
  }
}

class LocalizedNames {
  int? languageId;
  String? localizedName;

  LocalizedNames({this.languageId, this.localizedName});

  LocalizedNames.fromJson(Map<String?, dynamic> json) {
    languageId = json['language_id'];
    localizedName = json['localized_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['language_id'] = this.languageId;
    data['localized_name'] = this.localizedName;
    return data;
  }
}

class Image {
  String? src;
  Null attachment;
  Null seoFilename;
  int? id;

  Image({this.src, this.attachment, this.seoFilename, this.id});

  Image.fromJson(Map<String?, dynamic> json) {
    src = json['src'];
    attachment = json['attachment'];
    seoFilename = json['seoFilename'];
    id = json['id'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['src'] = this.src;
    data['attachment'] = this.attachment;
    data['seoFilename'] = this.seoFilename;
    data['id'] = this.id;
    return data;
  }
}
