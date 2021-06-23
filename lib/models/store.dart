class StoreResponseModel {
  int vendorId;
  String name;
  String logoUrl;
  double rating;
  double proximityInMeters;
  String estimatedPreparationTime;
  bool adultsOnly;
  List<String> vendorTags;

  StoreResponseModel(
      {this.vendorId,
      this.name,
      this.logoUrl,
      this.rating,
      this.proximityInMeters,
      this.estimatedPreparationTime,
      this.adultsOnly,
      this.vendorTags});

  StoreResponseModel.fromJson(Map<String, dynamic> json) {
    vendorTags = new List<String>();
    vendorId = json['vendorId'];
    name = json['name'];
    logoUrl = json['logoUrl'];
    rating = json['rating'];
    proximityInMeters = json['proximityInMeters'];
    estimatedPreparationTime = json['estimatedPreparationTime'];
    adultsOnly=json['adultsLimitated'];
    var list = json['vendorTags'];

    for (var item in list) {
      vendorTags.add(item);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorId'] = vendorId;
    data['name'] = name;
    data['logoUrl'] = logoUrl;
    data['rating'] = rating;
    data['proximityInMeters'] = proximityInMeters;
    data['estimatedPreparationTime'] = estimatedPreparationTime;
    data['adultsLimitated'] = adultsOnly;
    data['vendorTags'] = vendorTags;

    return data;
  }
}
