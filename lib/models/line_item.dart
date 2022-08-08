import 'package:fluidxtores/models/metadata.dart';
import 'package:fluidxtores/models/taxes.dart';

class LineItem {
  int? _id;
  String? _subTotalTax;
  String? _totalTax;
  List<Taxes>? _taxesList = [];
  String? _sku;
  int? _price;

  ///Product name
  String? name;

  ///Product ID
  int? productID;

  ///Variation ID, if applicable
  int? variationID;

  ///Quantity ordered
  int? quantity;

  ///Slug of the tax class of produc
  String? taxClass;

  ///Line subtotal (before discounts)
  String? subTotal;

  ///Line total (after discounts)
  String? total;

  ///Meta data
  List<Metadata>? metadata = [];

  //getters
  ///Item ID
  int? get id => this._id;

  ///Line subtotal tax (before discounts)
  String? get subTotalTax => this._subTotalTax;

  ///Line total tax (after discounts)
  String? get totalTax => this._totalTax;

  ///Line taxes
  List<Taxes>? get taxesList => this._taxesList;

  ///Product SKU
  String? get sku => this._sku;

  ///Product price
  int? get price => this._price;

  LineItem(
      {this.productID,
      this.quantity,
      this.variationID,
      this.total,
      this.subTotal,
      this.taxClass,
      this.metadata,
      this.name});

  LineItem.fromJSON(dynamic json) {
    this._id = json['id'];
    this._subTotalTax = json['subtotal_tax'];
    this._totalTax = json['total_tax'];
    List<dynamic> _tttl = json['taxes'];
    _tttl.forEach((_ttt) {
      _taxesList!.add(Taxes.fromJSON(_ttt));
    });
    this._sku = json['sku'];
    this._price = json['price'];

    this.name = json['name'];
    this.productID = json['product_id'];
    this.quantity = json['quantity'];
    this.variationID = json['variation_id'];
    this.taxClass = json['tax_class'];
    this.subTotal = json['subtotal'];
    this.total = json['total'];
    List<dynamic> _mtdtl = json['meta_data'];
    _mtdtl.forEach((_mtdt) {
      this.metadata!.add(Metadata.fromJSON(_mtdt));
    });
  }

  Map<String?, dynamic> toJson() {
    List<dynamic> mtdtl = [];
    this.metadata!.forEach((metadata) {
      mtdtl.add(metadata.toMap());
    });
    return {
      'name': this.name,
      'product_id': this.productID,
      'quantity': this.quantity,
      'variation_id': this.variationID,
      'tax_class': this.taxClass,
      'subtotal': this.subTotal,
      'total': this.total,
      'meta_data': mtdtl,
    };
  }
}
