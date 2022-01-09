class ClientAddress {
  String country;
  String city;
  String address;
  String zipCode;
  double latitude;
  double longitude;
  String phoneNumber;

  ClientAddress(
      {this.country,
      this.city,
      this.address,
      this.zipCode,
      this.latitude,
      this.longitude,
      this.phoneNumber});

  ClientAddress.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    address = json['address'];
    zipCode = json['zip_postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  ClientAddress.fromGoogleMapJson(Map<String, dynamic> json) {
    address = json['addressLine'];
    country = json['countryName'];
    city = json['locality'];
    zipCode = json['postalCode'];
    latitude = json['coordinates']['latitude'];
    longitude = json['coordinates']['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['zip_postal_code'] = this.zipCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone_number'] = this.phoneNumber;

    return data;
  }
}
