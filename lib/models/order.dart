import 'package:fluidxtores/configuration/env_config.dart';
import 'package:fluidxtores/models/Billing.dart';
import 'package:fluidxtores/models/couponLine.dart';
import 'package:fluidxtores/models/feeLine.dart';
import 'package:fluidxtores/models/line_item.dart';
import 'package:fluidxtores/models/metadata.dart';
import 'package:fluidxtores/models/refund.dart';
import 'package:fluidxtores/models/shipping.dart';
import 'package:fluidxtores/models/shippingLine.dart';
import 'package:fluidxtores/models/taxLine.dart';

class Order {
  static const OrderStatus_PENDING = "pending";
  static const OrderStatus_PROCESSING = "processing";
  static const OrderStatus_ONHOLD = "on-hold";
  static const OrderStatus_COMPLETED = "completed";
  static const OrderStatus_CANCELLED = "cancelled";
  static const OrderStatus_REFUNDED = "refunded";
  static const OrderStatus_FAILED = "failed";
  static const OrderStatus_TRASH = "trash";

  int? _id;
  String? _number;
  String? _orderKey;
  String? _createVia;
  String? _version;
  DateTime? _createdDate;
  DateTime? _createdDateGMT;
  DateTime? _modifiedDate;
  DateTime? _modifiedDateGMT;
  String? _totalDiscount;
  String? _taxDiscount;
  String? _totalShipping;
  String? _taxShipping;
  String? _taxCart;
  String? _total;
  String? _totalTax;
  bool? _priceIncludedTax;
  String? _customerIPAddress;
  String? _customerUserAgent;
  DateTime? _paidDate;
  DateTime? _paidDateGMT;
  DateTime? _completedDate;
  DateTime? _completedDateGMT;
  String? _cartHash;
  List<TaxLine>? _taxLines;
  List<Refund>? _refunds;
  bool? _setPaid;

  ///Order status. \
  ///Options: `Order.OrderStatus_PENDING`, \
  ///`Order.OrderStatus_PROCESSING`, \
  ///`Order.OrderStatus_ONHOLD`, \
  ///`Order.OrderStatus_COMPLETED`,\
  ///`Order.OrderStatus_CANCELLED`,\
  ///`Order.OrderStatus_REFUNDED`,\
  ///`Order.OrderStatus_FAILED`,\
  ///`Order.OrderStatus_TRASH`. \
  ///Default is `OrderStatus_PENDING``\
  String? status;

  ///Currency the order was created with, in ISO format. \
  ///Options: `AED`, `AFN`, `ALL`, `AMD`, `ANG`, `AOA`, `ARS`, `AUD`, `AWG`, `AZN`, `BAM`, `BBD`, `BDT`, `BGN`, `BHD`, `BIF`, `BMD`, `BND`, `BOB`, `BRL`, `BSD`, `BTC`, `BTN`, `BWP`, `BYR`, `BZD`, `CAD`, `CDF`, `CHF`, `CLP`, `CNY`, `COP`, `CRC`, `CUC`, `CUP`, `CVE`, `CZK`, `DJF`, `DKK`, `DOP`, `DZD`, `EGP`, `ERN`, `ETB`, `EUR`, `FJD`, `FKP`, `GBP`, `GEL`, `GGP`, `GHS`, `GIP`, `GMD`, `GNF`, `GTQ`, `GYD`, `HKD`, `HNL`, `HRK`, `HTG`, `HUF`, `IDR`, `ILS`, `IMP`, `INR`, `IQD`, `IRR`, `IRT`, `ISK`, `JEP`, `JMD`, `JOD`, `JPY`, `KES`, `KGS`, `KHR`, `KMF`, `KPW`, `KRW`, `KWD`, `KYD`, `KZT`, `LAK`, `LBP`, `LKR`, `LRD`, `LSL`, `LYD`, `MAD`, `MDL`, `MGA`, `MKD`, `MMK`, `MNT`, `MOP`, `MRO`, `MUR`, `MVR`, `MWK`, `MXN`, `MYR`, `MZN`, `NAD`, `NGN`, `NIO`, `NOK`, `NPR`, `NZD`, `OMR`, `PAB`, `PEN`, `PGK`, `PHP`, `PKR`, `PLN`, `PRB`, `PYG`, `QAR`, `RON`, `RSD`, `RUB`, `RWF`, `SAR`, `SBD`, `SCR`, `SDG`, `SEK`, `SGD`, `SHP`, `SLL`, `SOS`, `SRD`, `SSP`, `STD`, `SYP`, `SZL`, `THB`, `TJS`, `TMT`, `TND`, `TOP`, `TRY`, `TTD`, `TWD`, `TZS`, `UAH`, `UGX`, `USD`, `UYU`, `UZS`, `VEF`, `VND`, `VUV`, `WST`, `XAF`, `XCD`, `XOF`, `XPF`, `YER`, `ZAR` and `ZMW`. Default is `USD`
  String? currency;

  ///Parent order ID
  int? parentID;

  ///User ID who owns the order. `0` for guests. Default is `0`
  int? customerId;

  ///Note left by customer during checkout
  String? customerNote;

  ///Billing address
  Billing? billing;

  ///Shipping address
  Shipping? shipping;

  ///Payment method ID
  String? paymentMethod;

  ///Payment method title
  String? paymentMethodTitle;

  ///Unique transaction ID
  String? transactionID;

  ///Meta data
  List<Metadata>? MetadataList;

  ///Line items data
  List<LineItem>? lineItems;

  ///Shipping lines data
  List<ShippingLine>? shippingLines;

  ///Fee lines data
  List<FeeLine>? feelines;

  ///Coupons line data
  List<CouponLine>? couponLines;

  //getters
  ///Unique identifier for the resource
  int? get id => this._id;

  ///Order number
  String? get number => this._number;

  ///Order key
  String? get orderKey => this._orderKey;

  ///Shows where the order was created
  String? get createdVia => this._createVia;

  ///Version of Commerce which last updated the order
  String? get version => this._version;

  ///The date the order was created, in the site's timezone
  DateTime? get createdDate => this._createdDate;

  ///The date the order was created, as GMT
  DateTime? get createdDateGMT => this._createdDateGMT;

  ///The date the order was last modified, in the site's timezone
  DateTime? get modifiedDate => this._modifiedDate;

  ///The date the order was last modified, as GMT
  DateTime? get modifiedDateGMT => this._modifiedDateGMT;

  ///Total discount amount for the order
  String? get totalDiscount => this._totalDiscount;

  ///Total discount tax amount for the order
  String? get taxDiscount => this._taxDiscount;

  ///Total shipping amount for the order
  String? get totalShipping => this._totalShipping;

  ///Total shipping tax amount for the order
  String? get taxShipping => this._taxShipping;

  ///Sum of line item taxes only
  String? get taxCart => this._taxCart;

  ///Grand total
  String? get total => this._total;

  ///Sum of all taxes
  String? get totalTax => this._totalTax;

  ///True the prices included tax during checkout
  bool? get priceIncludedTax => this._priceIncludedTax;

  ///Customer's IP address
  String? get customerIPAddress => this._customerIPAddress;

  ///User agent of the customer
  String? get customerUserAgent => this._customerUserAgent;

  ///The date the order was paid, in the site's timezone
  DateTime? get paidDate => this._paidDate;

  ///The date the order was paid, as GMT
  DateTime? get paidDateGMT => this._paidDateGMT;

  ///The date the order was completed, in the site's timezone
  DateTime? get completedDate => this._completedDate;

  ///The date the order was completed, as GMT
  DateTime? get completedDateGMT => this._completedDateGMT;

  ///MD5 hash of cart items to ensure orders are not modified
  String? get cartHash => this._cartHash;

  ///Tax lines data
  List<TaxLine>? get taxLines => this._taxLines;

  ///List of refunds
  List<Refund>? get refunds => this._refunds;

  //setters
  ///Define if the order is paid. It will set the status to processing and reduce stock items. Default is `false`
  set setPaid(bool? isSet) => this._setPaid = isSet;

  Order({
    this.paymentMethod,
    this.shipping,
    this.billing,
    this.customerId,
    this.customerNote,
    this.lineItems,
    this.couponLines,
    this.currency,
    this.feelines,
    this.parentID,
    this.paymentMethodTitle,
    this.shippingLines,
    this.status,
    this.transactionID,
    this.MetadataList,
  });

  Order.fromJSON(dynamic json) {
    this._id = json['id'];
    this._number = json['number'];
    this._orderKey = json['order_key'];
    this._createVia = json['created_via'];
    this._version = json['version'];
    this._createdDate = _dtDecode(json['date_created']);
    this._createdDateGMT = _dtDecode(json['date_created_gmt']);
    this._modifiedDate = _dtDecode(json['date_modified']);
    this._modifiedDateGMT = _dtDecode(json['date_modified_gmt']);
    this._totalDiscount = json['discount_total'];
    this._taxDiscount = json['discount_tax'];
    this._totalShipping = json['shipping_total'];
    this._taxShipping = json['shipping_tax'];
    this._taxCart = json['cart_tax'];
    this._total = json['total'];
    this._totalTax = json['total_tax'];
    this._priceIncludedTax = json['prices_include_tax'];
    this._customerIPAddress = json['customer_ip_address'];
    this._customerUserAgent = json['customer_user_agent'];
    this._paidDate = _dtDecode(json['date_paid']);
    this._paidDateGMT = _dtDecode(json['date_paid_gmt']);
    this._completedDate = _dtDecode(json['date_completed']);
    this._completedDateGMT = _dtDecode(json['date_completed_gmt']);
    this._cartHash = json['cart_hash'];

    List<dynamic> _tl = json['tax_lines'];
    _taxLines = _tl.map((_tlIT) => TaxLine.fromJSON(_tlIT)).toList();

    List<dynamic> _ref = json['refunds'];
    _refunds = _ref.map((_refIT) => Refund.fromJSON(_refIT)).toList();

    this.parentID = json['parent_id'];
    this.status = json['status'];
    this.currency = json['currency'];
    this.customerId = json['customer_id'];
    this.customerNote = json['customer_note'];
    this.billing = Billing.fromJSON(json['billing']);
    this.shipping = Shipping.fromJSON(json['shipping']);
    this.paymentMethod = json['payment_method'];
    this.paymentMethodTitle = json['payment_method_title'];
    this.transactionID = json['transaction_id'];

    List<dynamic> _lit = json['line_items'];
    lineItems = _lit.map((lineitem) => LineItem.fromJSON(lineitem)).toList();

    List<dynamic> _mtdt = json['meta_data'];
    MetadataList =
        _mtdt.map((_mtdtIT) => Metadata.fromJSON(_mtdtIT)).toList();

    List<dynamic> _spl = json['shipping_lines'];
    shippingLines =
        _spl.map((_splIT) => ShippingLine.fromJSON(_splIT)).toList();

    List<dynamic> _feel = json['fee_lines'];
    feelines = _feel.map((_feelIT) => FeeLine.fromJSON(_feelIT)).toList();

    List<dynamic> _cupl = json['coupon_lines'];
    couponLines = _cupl.map((_cuplIT) => CouponLine.fromJSON(_cuplIT)).toList();
  }

  Map<String?, dynamic> toMap() {
    return {
      'parent_id': this.parentID,
      'status': this.status,
      'currency': this.currency,
      'customer_id': this.customerId,
      'customer_note': this.customerNote,
      'billing': this.billing,
      'shipping': this.shipping,
      'payment_method': this.paymentMethod,
      'payment_method_title': this.paymentMethodTitle,
      'transaction_id': this.transactionID,
      'line_items': this.lineItems!.map((e) => e.toJson() as dynamic).toList(),
      'meta_data':
          this.MetadataList!.map((e) => e.toMap() as dynamic).toList(),
      'shipping_lines':
          this.shippingLines!.map((e) => e.toMap() as dynamic).toList(),
      'fee_lines': this.feelines!.map((e) => e.toMap() as dynamic).toList(),
      'coupon_lines':
          this.couponLines!.map((e) => e.toMap() as dynamic).toList(),
      if (this._setPaid != null) "set_paid": this._setPaid,
    };
  }
}


DateTime? _dtDecode(String dt) {
  return (dt != null) ? DateTime.parse(dt) : null;
}
