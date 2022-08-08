import 'package:fluidxtores/models/metadata.dart';
import 'package:fluidxtores/models/taxes.dart';

class ShippingLine {
  int? _id;
  String? _totalTax;
  List<Taxes>? _taxes = [];

  ///Shipping method name
  String? methodTitle;

  ///Shipping method ID.
  String? methodID;

  ///Line total (after discounts)
  String? total;

  ///Meta data
  List<Metadata>? metadata = [];

  //getters
  ///Item ID
  int? get id => this._id;

  ///Line total tax (after discounts)
  String? get totalTax => this._totalTax;

  ///Line taxes
  List<Taxes>? get taxes => this._taxes;

  ShippingLine({this.metadata, this.methodID, this.methodTitle, this.total});

  ShippingLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this.methodTitle = json['method_title'];
    this.methodID = json['method_id'];
    this.total = json['total'];
    this._totalTax = json['total_tax'];
    List<dynamic> _ttt = json['taxes'];
    _ttt.forEach((tax) {
      _taxes!.add(Taxes.fromJSON(tax));
    });
    List<dynamic> _mtdt = json['meta_data'];
    _mtdt.forEach((mt) {
      metadata!.add(Metadata.fromJSON(mt));
    });
  }

  Map<String?, dynamic> toMap() {
    List<dynamic> mtdtM = [];
    this.metadata!.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      'method_title': this.methodTitle,
      'method_id': this.methodID,
      'total': this.total,
      'meta_data': mtdtM
    };
  }
}
