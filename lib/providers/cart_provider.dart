import 'package:flutter/material.dart';
import 'package:fluid/contracts/address_service_contract.dart';
import 'package:fluid/contracts/authentication_service_contract.dart';
import 'package:fluid/models/Cart.dart';
import 'package:fluid/models/Product.dart';
import 'package:fluid/models/new_order_request.dart';
import 'package:fluid/models/store_info.dart';
import 'package:fluid/models/user_response.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<CartItem> shoppingCartItems = new List<CartItem>();
  final AuthenticationServiceContract _authenticationService;
  final AddressServiceContract _addressService;
  String shippingMethodName = 'Ground';

  StoreBasicInfo _store;
  double totalAmount = 0.0;
  PaymentMethodType selectedMethod;
  String selectedCreditCardId;

  PaymentMethodType get selected => selectedMethod;

  set selected(PaymentMethodType selected) {
    selectedMethod = selected;
    notifyListeners();
  }

  ShoppingCartProvider(this._authenticationService, this._addressService);

  StoreBasicInfo get storeInfo {
    return _store;
  }

  bool existsProduct(Product product) {
    return shoppingCartItems
        .any((element) => element.product.title == product.title);
  }

  void addProductToCart(Product product, int quantity) {
    if (product == null) return;

    if (!existsProduct(product)) {
      shoppingCartItems
          .add(new CartItem(product: product, numOfItem: quantity));
      totalAmount = getShoppingCartTotal();
      notifyListeners();
    }
  }

  double getShoppingCartTotal() {
    double total = 0.00;

    for (var item in shoppingCartItems) {
      total += double.parse(item.product.price) * item.numOfItem;
    }

    return total;
  }

  int getProductsCount() {
    int items = 0;
    for (var item in shoppingCartItems) {
      items += item.numOfItem;
    }
    return items;
  }

  void deleteProduct(Product product) {
    shoppingCartItems = shoppingCartItems
        .where((element) => element.product.title != product.title)
        .toList();

    if (shoppingCartItems.length == 0) {
      deleteShoppingCartItems();
    }

    notifyListeners();
  }

  void incrementProductQuantity(Product product) {
    for (var item in shoppingCartItems) {
      if (item.product.title == product.title && item.numOfItem < 10) {
        item.numOfItem += 1;
        break;
      }
    }

    notifyListeners();
  }

  void decreaseProductQuantity(Product product) {
    for (var item in shoppingCartItems) {
      if (item.product.title == product.title && item.numOfItem > 1) {
        item.numOfItem -= 1;
        break;
      }
    }
    notifyListeners();
  }

  bool hasDifferentVendorOnCart(StoreBasicInfo store) {
    int count = getProductsCount();
    if (_store == null || count <= 0) {
      return false;
    }

    return _store.storeName != store.storeName;
  }

  Future<CreateOrderRequest> buildCreateOrderRequest() async {
    OrderToCreate order = OrderToCreate();
    order.orderSubtotalInclTax = totalAmount.toString();
    order.orderSubtotalExclTax = totalAmount.toString();
    order.orderSubTotalDiscountInclTax = '0';
    order.orderSubTotalDiscountExclTax = '0';
    order.orderShippingInclTax = '0';
    order.orderShippingExclTax = '0';
    order.paymentMethodAdditionalFeeInclTax = '0';
    order.paymentMethodAdditionalFeeExclTax = '0';
    order.orderTax = '0';
    order.orderDiscount = '0';
    order.orderTotal = totalAmount.toString();
    order.createdOnUtc = DateTime.now();
    order.shippingMethod = shippingMethodName;
    order.paymentMethodCheckoutAttribute = getPaymentMethodAttribute();

    final UserResponse user =
        await _authenticationService.getCurrentLoggedUser();
    order.customerId = user.id.toString();

    final userAddress = await _addressService.getSelectedAddress();
    final panamaCountry = 167;

    final requestAddress = IngAddress(
        id: 1,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        city: userAddress.city,
        address1: userAddress.address,
        phoneNumber: user.phone,
        zipPostalCode: userAddress.zipCode ?? '99',
        countryId: panamaCountry);

    final requestAddressCoordinates = IngAddressWithCoordinates(
        id: 1,
        firstName: requestAddress.firstName,
        lastName: requestAddress.lastName,
        email: requestAddress.email,
        city: requestAddress.city,
        address1: requestAddress.address1,
        phoneNumber: requestAddress.phoneNumber,
        zipPostalCode: requestAddress.zipPostalCode ?? '99',
        countryId: panamaCountry,
        longitude: userAddress.longitude,
        latitude: userAddress.latitude);

    order.billingAddress = requestAddress;
    order.shippingAddress = requestAddress;
    order.shippingAddressWithCoordinates = requestAddressCoordinates;

    order.orderItems = shoppingCartItems
        .map((e) => new OrderItem(
            quantity: e.numOfItem,
            unitPriceInclTax: 0.0,
            unitPriceExclTax: 0.0,
            priceInclTax: 0.0,
            priceExclTax: 0.0,
            discountAmountInclTax: 0.0,
            discountAmountExclTax: 0.0,
            originalProductCost: 0.0,
            attributeDescription: 0,
            downloadCount: 0,
            isDownloadActivated: 'false',
            licenseDownloadId: 0,
            itemWeight: 0,
            productId: e.product.id,
            productAttributes: []))
        .toList();

    return CreateOrderRequest(order: order);
  }

  deleteShoppingCartItems() {
    shoppingCartItems = [];
    totalAmount = 0;
    notifyListeners();
  }

  String getPaymentMethodAttribute() {
    switch (selectedMethod) {
      case PaymentMethodType.cash:
        return "Efectivo";
        break;
      case PaymentMethodType.claveCard:
        return "TarjetaClave";
      case PaymentMethodType.creditCard:
        return "TarjetaCredito";
        break;
      default:
        return "Efectivo";
    }
  }
}

enum PaymentMethodType { none, creditCard, cash, claveCard }
