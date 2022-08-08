import 'package:fluidxtores/models/metadata.dart';
import 'package:fluidxtores/models/taxes.dart';

class FeeLine {
  static const String? TaxStatus_TEXABLE = 'taxable';
  static const String? TaxStatus_NONE = 'none';

  int? _id;
  String? _totalTax;
  List<Taxes>? _taxes = [];

  ///Fee name
  String? name;

  ///Tax class of fee
  String? taxClass;

  ///Tax status of fee. \
  ///Options: `FeeLine.TaxStatus_TEXABLE` and `FeeLine.TaxStatus_NONE`
  String? taxStatus;

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

  FeeLine(
      {this.metadata, this.name, this.taxClass, this.total, this.taxStatus});

  FeeLine.fromJSON(dynamic json) {
    this._id = json['id'];
    this._totalTax = json['total_tax'];
    List<dynamic> _taxesDyn = json['taxes'];
    _taxesDyn.forEach((tax) {
      _taxes!.add(Taxes.fromJSON(tax));
    });
    this.name = json['name'];
    this.taxClass = json['tax_class'];
    this.taxStatus = json['tax_status'];
    this.total = json['total'];
    List<dynamic> _mtdt = json['meta_data'];
    _mtdt.forEach((mtdtit) {
      metadata!.add(Metadata.fromJSON(mtdtit));
    });
  }

  Map<String?, dynamic> toMap() {
    List<dynamic> mtdtM = [];
    this.metadata!.forEach((mtdt) {
      mtdtM.add(mtdt.toMap());
    });
    return {
      'name': this.name,
      'tax_class': this.taxClass,
      'tax_status': this.taxStatus,
      'total': this.total,
      'meta_data': mtdtM,
    };
  }
}
