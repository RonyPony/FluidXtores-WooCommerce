import 'Billing.dart';
import 'shipping.dart';

class Customer {
  int? _id;
  DateTime? _createdDate;
  DateTime? _createdDateGMT;
  DateTime? _modifiedDate;
  DateTime? _modifiedDateGMT;
  bool? _isPayingCustomer;
  String? _avatarUrl;
  String? _email;
  String? _password; //POST only
  String? _role;

  ///Customer first name
  String? firstName;

  ///Customer last name
  String? lastName;

  ///Customer login name
  String? userName;

  ///Don't forget to validate form (eg: `email`). Unless you may got error.
  ///List of billing address data
  Billing? billing;

  ///List of shipping address data
  Shipping? shipping;

  //getters
  ///Unique identifier for the resource
  int? get id => this._id;

  ///The date the customer was created, in the site's timezone
  DateTime? get createdDate => this._createdDate;

  ///The date the customer was created, as GMT
  DateTime? get createdDateGMT => this._createdDateGMT;

  ///The date the customer was last modified, in the site's timezone
  DateTime? get modifiedDate => this._modifiedDate;

  ///The date the customer was last modified, as GMT
  DateTime? get modifiedDateGMT => this._modifiedDateGMT;

  ///The email address for the customer
  String? get email => this._email;

  ///Customer role
  String? get role => this._role;

  ///Is the customer a paying customer?
  bool? get isPayingCustomer => this._isPayingCustomer;

  ///Avatar URL
  String? get avatarUrl => this._avatarUrl;

  //setters

  ///The email address for the customer
  set setEmail(mail) => this._email = mail;

  ///Customer password
  set setPassword(passwd) => this._password = passwd;

  Customer(
      {this.firstName,
      this.lastName,
      this.userName,
      this.billing,
      this.shipping});

  Customer.fromJSON(dynamic json, {bool? oldVersion: false}) {
    if (oldVersion!) {
      this._id = json['id'];
      this._createdDate = DateTime?.parse(json['created_at']);
      this._modifiedDate = DateTime?.parse(json['last_update']);
      this._email = json['email'];
      this.firstName = json['first_name'];
      this.lastName = json['last_name'];
      this.userName = json['username'];
      this._role = json['role'];
      this.billing = Billing.fromJSON(json['billing_address']);
      this.shipping = Shipping.fromJSON(json['shipping_address']);
      this._avatarUrl = json['avatar_url'];
    } else {
      this._id = json['id'];
      this._createdDate = DateTime?.parse(json['date_created']);
      this._modifiedDate = DateTime?.parse(json['date_modified']);
      this._email = json['email'];
      this.firstName = json['first_name'];
      this.lastName = json['last_name'];
      this.userName = json['username'];
      this._role = json['role'];
      this.billing = Billing.fromJSON(json['billing']);
      this.shipping = Shipping.fromJSON(json['shipping']);
      this._isPayingCustomer = json['is_paying_customer'];
      this._avatarUrl = json['avatar_url'];
    }
  }

  Map<String?, dynamic> toMap() {
    return {
      'first_name': this.firstName,
      'last_name': this.lastName,
      'username': this.userName,
      if (this._email != null) 'email': this._email,
      if (this._password != null) 'password': this._password,
      if (this.billing != null) 'billing': this.billing?.toJson(),
      if (this.shipping != null) 'shipping': this.shipping?.toJson()
    };
  }
}
