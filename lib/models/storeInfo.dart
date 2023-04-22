class StoreInfo {
  List<Stores>? stores;

  StoreInfo({this.stores});

  StoreInfo.fromJson(Map<String, dynamic> json) {
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(new Stores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stores {
  String? name;
  String? url;
  bool? sslEnabled;
  Null? secureUrl;
  String? hosts;
  int? defaultLanguageId;
  List<int>? languageIds;
  int? displayOrder;
  String? companyName;
  String? companyAddress;
  String? companyPhoneNumber;
  Null? companyVat;
  String? defProductPicture;
  String? logo;
  bool? storeClosed;
  String? facebookLink;
  String? twitterLink;
  String? youtubeLink;
  String? instagramLink;
  String? primaryCurrencyDisplayLocale;
  int? id;

  Stores(
      {this.name,
      this.url,
      this.sslEnabled,
      this.secureUrl,
      this.hosts,
      this.defaultLanguageId,
      this.languageIds,
      this.displayOrder,
      this.companyName,
      this.companyAddress,
      this.companyPhoneNumber,
      this.companyVat,
      this.defProductPicture,
      this.logo,
      this.storeClosed,
      this.facebookLink,
      this.twitterLink,
      this.youtubeLink,
      this.instagramLink,
      this.primaryCurrencyDisplayLocale,
      this.id});

  Stores.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    sslEnabled = json['ssl_enabled'];
    secureUrl = json['secure_url'];
    hosts = json['hosts'];
    defaultLanguageId = json['default_language_id'];
    languageIds = json['language_ids'].cast<int>();
    displayOrder = json['display_order'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    companyPhoneNumber = json['company_phone_number'];
    companyVat = json['company_vat'];
    defProductPicture = json['def_product_picture'];
    logo = json['logo'];
    storeClosed = json['store_closed'];
    facebookLink = json['facebook_link'];
    twitterLink = json['twitter_link'];
    youtubeLink = json['youtube_link'];
    instagramLink = json['instagram_link'];
    primaryCurrencyDisplayLocale = json['primary_currency_display_locale'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['ssl_enabled'] = this.sslEnabled;
    data['secure_url'] = this.secureUrl;
    data['hosts'] = this.hosts;
    data['default_language_id'] = this.defaultLanguageId;
    data['language_ids'] = this.languageIds;
    data['display_order'] = this.displayOrder;
    data['company_name'] = this.companyName;
    data['company_address'] = this.companyAddress;
    data['company_phone_number'] = this.companyPhoneNumber;
    data['company_vat'] = this.companyVat;
    data['def_product_picture'] = this.defProductPicture;
    data['logo'] = this.logo;
    data['store_closed'] = this.storeClosed;
    data['facebook_link'] = this.facebookLink;
    data['twitter_link'] = this.twitterLink;
    data['youtube_link'] = this.youtubeLink;
    data['instagram_link'] = this.instagramLink;
    data['primary_currency_display_locale'] = this.primaryCurrencyDisplayLocale;
    data['id'] = this.id;
    return data;
  }
}
