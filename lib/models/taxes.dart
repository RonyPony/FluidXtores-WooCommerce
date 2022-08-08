import 'package:fluidxtores/models/metadata.dart';

class Taxes {
  int? _id;
  String? _rateCode;
  String? _rateID;
  String? _label;
  bool? _compound;
  String? _taxTotal;
  String? _shippingTaxTotal;

  ///Meta data
  List<Metadata>? metadata = [];

  ///Item ID
  int? get id => this._id;

  ///Tax rate code
  String? get rateCode => this._rateCode;

  ///Tax rate ID
  String? get rateID => this._rateID;

  ///Tax rate label
  String? get label => this._label;

  ///Show if is a compound tax rate
  bool? get compound => this._compound;

  ///Tax total (not including shipping taxes)
  String? get taxTotal => this._taxTotal;

  ///Shipping tax total
  String? get shippingTaxTotal => this._shippingTaxTotal;

  Taxes({this.metadata});

  Taxes.fromJSON(dynamic json) {
    this._id = json['id'];
    this._rateCode = json['rate_code'];
    this._rateID = json['rate_id'];
    this._label = json['label'];
    this._compound = json['compound'];
    this._taxTotal = json['tax_total'];
    this._shippingTaxTotal = json['shipping_tax_total'];
    List<dynamic> _mtdtl = json['meta_data'];
    _mtdtl.forEach((_mtdt) {
      this.metadata!.add(Metadata.fromJSON(_mtdt));
    });
  }

  Map<String?, dynamic> toMap() {
    List<dynamic> mtdtl = [];
    this.metadata!.forEach((woometadata) {
      mtdtl.add(woometadata.toMap());
    });
    return {'meta_data': mtdtl};
  }
}
