import 'package:fluidxtores/models/metadata.dart';

class TaxLine {
  int? _id;
  String? _rateCode;
  String? _rateID;
  String? _label;
  bool? _compound;
  String? _totalTax;
  String? _totalShippingTax;

  ///Meta data
  List<Metadata>? metadata = [];

  //getters
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
  String? get totalTax => this._totalTax;

  ///Shipping tax total
  String? get totalShippingTax => this._totalShippingTax;

  TaxLine({this.metadata});

  TaxLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this._rateCode = json['rate_code'];
    this._rateID = json['rate_id'];
    this._label = json['label'];
    this._compound = json['compound'];
    this._totalTax = json['tax_total'];
    this._totalShippingTax = json['shipping_tax_total'];
    List<dynamic> mtdtl = json['meta_data'];
    mtdtl.forEach((mtdt) {
      this.metadata!.add(Metadata.fromJSON(mtdt));
    });
  }

  Map<String?, dynamic> toJson() {
    List<dynamic> mtdtM = [];
    this.metadata!.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      // 'id': this._id,
      // 'rate_code': this._rateCode,
      // 'rateID': this._rateID,
      // 'label': this._label,
      // 'compound': this._compound,
      // 'tax_total': this._totalTax,
      // 'shipping_tax_total': this._totalShippingTax,
      'meta_data': mtdtM,
    };
  }
}
