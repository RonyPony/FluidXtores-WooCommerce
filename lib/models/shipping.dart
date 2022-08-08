class Shipping {
  ///First name
  String? firstName;

  ///Last name
  String? lastName;

  ///Company name
  String? company;

  ///Address line 1
  String? address1;

  ///Address line 2
  String? address2;

  ///City name
  String? city;

  ///ISO code or name of the state, province or district
  String? state;

  ///Postal code
  String? postCode;

  ///ISO code of the country
  String? country;

  Shipping({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.state,
    this.postCode,
  });

  Shipping.fromJSON(dynamic json) {
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.company = json['company'];
    this.address1 = json['address_1'];
    this.address2 = json['address_2'];
    this.city = json['city'];
    this.state = json['state'];
    this.postCode = json['postcode'];
    this.country = json['country'];
  }

  Map<String?, dynamic> toJson() {
    return {
      'first_name': this.firstName,
      'last_name': this.lastName,
      'company': this.company,
      'address_1': this.address1,
      'address_2': this.address2,
      'city': this.city,
      'state': this.state,
      'postcode': this.postCode,
      'country': this.country,
    };
  }
}
