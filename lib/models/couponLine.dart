import 'package:fluidxtores/models/metadata.dart';

class CouponLine {
  int? _id;
  String? _discount;
  String? _discountTax;

  ///Coupon code
  String? code;

  ///Meta data
  List<Metadata>? metadata;

  //getters
  ///Item ID
  int? get id => this._id;

  ///Discount total
  String? get discount => this._discount;

  ///Discount total tax
  String? get discountTax => this._discountTax;

  CouponLine({this.code, this.metadata});

  CouponLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this._discount = json['discount'];
    this._discountTax = json['discount_tax'];
    this.code = json['code'];
    List<dynamic> mtdtl = json['meta_data'];
    mtdtl.forEach((mtdt) {
      this.metadata!.add(Metadata.fromJSON(mtdt));
    });
  }

  Map<String?, dynamic> toMap() {
    List<dynamic> mtdtM = [];
    this.metadata!.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      'code': this.code,
      'meta_data': mtdtM,
    };
  }
}
