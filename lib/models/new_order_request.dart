import 'dart:convert';

CreateOrderRequest createOrderRequestFromJson(String str) =>
    CreateOrderRequest.fromJson(json.decode(str));

String createOrderRequestToJson(CreateOrderRequest data) =>
    json.encode(data.toJson());

class CreateOrderRequest {
  CreateOrderRequest({
    this.order,
  });

  OrderToCreate order;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      CreateOrderRequest(
        order: OrderToCreate.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order.toJson(),
      };
}

class OrderToCreate {
  OrderToCreate(
      {this.orderSubtotalInclTax,
      this.orderSubtotalExclTax,
      this.orderSubTotalDiscountInclTax,
      this.orderSubTotalDiscountExclTax,
      this.orderShippingInclTax,
      this.orderShippingExclTax,
      this.paymentMethodAdditionalFeeInclTax,
      this.paymentMethodAdditionalFeeExclTax,
      this.orderTax,
      this.orderDiscount,
      this.orderTotal,
      this.createdOnUtc,
      this.customerId,
      this.billingAddress,
      this.shippingAddress,
      this.orderItems,
      this.shippingAddressWithCoordinates,
      this.paymentMethodCheckoutAttribute});

  String pickUpInStore = 'true';
  String paymentMethodSystemName = 'Payments.CyberSource';
  String customerCurrencyCode = 'USD';
  String currencyRate = '1.0000';
  String customerTaxDisplayTypeId = '10';

  String orderSubtotalInclTax;
  String orderSubtotalExclTax;
  String orderSubTotalDiscountInclTax;
  String orderSubTotalDiscountExclTax;
  String orderShippingInclTax;
  String orderShippingExclTax;
  String paymentMethodAdditionalFeeInclTax;
  String paymentMethodAdditionalFeeExclTax;

  String taxRates = '0:0;   ';
  String orderTax;
  String orderDiscount;
  String orderTotal;
  String refundedAmount = '0';

  String checkoutAttributeDescription = '';
  String customerLanguageId = '2';
  String affiliateId = '0';
  String shippingMethod = 'Ground';
  String shippingRateComputationMethodSystemName =
      'Shipping.FixedByWeightByTotal'; //
  String deleted = 'false';
  DateTime createdOnUtc;
  String customerId;
  IngAddress billingAddress;
  IngAddress shippingAddress;
  IngAddressWithCoordinates shippingAddressWithCoordinates;
  List<OrderItem> orderItems;
  String customerTaxDisplayType = '10';
  String paymentMethodCheckoutAttribute;

  factory OrderToCreate.fromJson(Map<String, dynamic> json) => OrderToCreate(
      orderSubtotalInclTax: json["order_subtotal_incl_tax"],
      orderSubtotalExclTax: json["order_subtotal_excl_tax"],
      orderSubTotalDiscountInclTax: json["order_sub_total_discount_incl_tax"],
      orderSubTotalDiscountExclTax: json["order_sub_total_discount_excl_tax"],
      orderShippingInclTax: json["order_shipping_incl_tax"],
      orderShippingExclTax: json["order_shipping_excl_tax"],
      paymentMethodAdditionalFeeInclTax:
          json["payment_method_additional_fee_incl_tax"],
      paymentMethodAdditionalFeeExclTax:
          json["payment_method_additional_fee_excl_tax"],
      orderTax: json["order_tax"],
      orderDiscount: json["order_discount"],
      orderTotal: json["order_total"],
      createdOnUtc: DateTime.parse(json["created_on_utc"]),
      customerId: json["customer_id"],
      billingAddress: IngAddress.fromJson(json["billing_address"]),
      shippingAddress: IngAddress.fromJson(json["shipping_address"]),
      orderItems: List<OrderItem>.from(
          json["order_items"].map((x) => OrderItem.fromJson(x))),
      shippingAddressWithCoordinates: IngAddressWithCoordinates.fromJson(
          json["shipping_address_coordinates"]),
      paymentMethodCheckoutAttribute:
          json["payment_method_checkout_attribute"]);

  Map<String, dynamic> toJson() => {
        "pick_up_in_store": pickUpInStore,
        "payment_method_system_name": getPaymentMethodSystemName(paymentMethodCheckoutAttribute),
        "customer_currency_code": customerCurrencyCode,
        "currency_rate": currencyRate,
        "customer_tax_display_type_id": customerTaxDisplayTypeId,
        "order_subtotal_incl_tax": orderSubtotalInclTax,
        "order_subtotal_excl_tax": orderSubtotalExclTax,
        "order_sub_total_discount_incl_tax": orderSubTotalDiscountInclTax,
        "order_sub_total_discount_excl_tax": orderSubTotalDiscountExclTax,
        "order_shipping_incl_tax": orderShippingInclTax,
        "order_shipping_excl_tax": orderShippingExclTax,
        "payment_method_additional_fee_incl_tax":
            paymentMethodAdditionalFeeInclTax,
        "payment_method_additional_fee_excl_tax":
            paymentMethodAdditionalFeeExclTax,
        "tax_rates": taxRates,
        "order_tax": orderTax,
        "order_discount": orderDiscount,
        "order_total": orderTotal,
        "refunded_amount": refundedAmount,
        "checkout_attribute_description": checkoutAttributeDescription,
        "customer_language_id": customerLanguageId,
        "affiliate_id": affiliateId,
        "shipping_method": shippingMethod,
        "shipping_rate_computation_method_system_name":
            shippingRateComputationMethodSystemName,
        "deleted": deleted,
        "created_on_utc":
            "${createdOnUtc.year.toString().padLeft(4, '0')}-${createdOnUtc.month.toString().padLeft(2, '0')}-${createdOnUtc.day.toString().padLeft(2, '0')}",
        "customer_id": customerId,
        "billing_address": billingAddress.toJson(),
        "shipping_address": shippingAddress.toJson(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "customer_tax_display_type": customerTaxDisplayType,
        "shipping_address_coordinates": shippingAddressWithCoordinates,
        "payment_method_checkout_attribute": paymentMethodCheckoutAttribute,
      };

  String getPaymentMethodSystemName(String paymentMethodCheckoutAttribute) {
    switch (paymentMethodCheckoutAttribute) {
      case 'Efectivo':
        return 'Payments.CheckMoneyOrder';

      case 'TarjetaCredito':
        return 'Payments.CyberSource';
      case 'TarjetaClave':
        return 'Payments.CheckMoneyOrder';
      default:
        return 'Payments.CheckMoneyOrder';
    }
  }
}

class IngAddress {
  IngAddress({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.city,
    this.address1,
    this.phoneNumber,
    this.zipPostalCode,
    this.countryId,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  String city;
  String address1;
  String phoneNumber;
  String zipPostalCode;
  int countryId;

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        city: json["city"],
        address1: json["address1"],
        phoneNumber: json["phone_number"],
        zipPostalCode: json["zip_postal_code"],
        countryId: json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "city": city,
        "address1": address1,
        "phone_number": phoneNumber,
        "zip_postal_code": zipPostalCode,
        "country_id": countryId,
      };
}

class IngAddressWithCoordinates {
  IngAddressWithCoordinates(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.city,
      this.address1,
      this.phoneNumber,
      this.zipPostalCode,
      this.countryId,
      this.latitude,
      this.longitude});

  int id;
  String firstName;
  String lastName;
  String email;
  String city;
  String address1;
  String phoneNumber;
  String zipPostalCode;
  int countryId;
  double longitude;
  double latitude;

  factory IngAddressWithCoordinates.fromJson(Map<String, dynamic> json) =>
      IngAddressWithCoordinates(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        city: json["city"],
        address1: json["address1"],
        phoneNumber: json["phone_number"],
        zipPostalCode: json["zip_postal_code"],
        countryId: json["country_id"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "city": city,
        "address1": address1,
        "phone_number": phoneNumber,
        "zip_postal_code": zipPostalCode,
        "country_id": countryId,
        "longitude": longitude,
        "latitude": latitude,
      };
}

class OrderItem {
  OrderItem({
    this.quantity,
    this.unitPriceInclTax,
    this.unitPriceExclTax,
    this.priceInclTax,
    this.priceExclTax,
    this.discountAmountInclTax,
    this.discountAmountExclTax,
    this.originalProductCost,
    this.attributeDescription,
    this.downloadCount,
    this.isDownloadActivated,
    this.licenseDownloadId,
    this.itemWeight,
    this.productId,
    this.productAttributes,
  });

  int quantity;
  double unitPriceInclTax;
  double unitPriceExclTax;
  double priceInclTax;
  double priceExclTax;
  double discountAmountInclTax;
  double discountAmountExclTax;
  double originalProductCost;
  int attributeDescription;
  int downloadCount;
  String isDownloadActivated;
  int licenseDownloadId;
  double itemWeight;
  int productId;
  List<dynamic> productAttributes;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        quantity: json["quantity"],
        unitPriceInclTax: json["unit_price_incl_tax"],
        unitPriceExclTax: json["unit_price_excl_tax"],
        priceInclTax: json["price_incl_tax"],
        priceExclTax: json["price_excl_tax"],
        discountAmountInclTax: json["discount_amount_incl_tax"],
        discountAmountExclTax: json["discount_amount_excl_tax"],
        originalProductCost: json["original_product_cost"],
        attributeDescription: json["attribute_description"],
        downloadCount: json["download_count"],
        isDownloadActivated: json["isDownload_activated"],
        licenseDownloadId: json["license_download_id"],
        itemWeight: json["item_weight"],
        productId: json["product_id"],
        productAttributes:
            List<dynamic>.from(json["product_attributes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "unit_price_incl_tax": unitPriceInclTax,
        "unit_price_excl_tax": unitPriceExclTax,
        "price_incl_tax": priceInclTax,
        "price_excl_tax": priceExclTax,
        "discount_amount_incl_tax": discountAmountInclTax,
        "discount_amount_excl_tax": discountAmountExclTax,
        "original_product_cost": originalProductCost,
        "attribute_description": attributeDescription,
        "download_count": downloadCount,
        "isDownload_activated": isDownloadActivated,
        "license_download_id": licenseDownloadId,
        "item_weight": itemWeight,
        "product_id": productId,
        "product_attributes":
            List<dynamic>.from(productAttributes.map((x) => x)),
      };
}
