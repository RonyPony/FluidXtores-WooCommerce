import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {
  Product product;
  int numOfItem;

  CartItem({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<CartItem> demoCarts = [
  CartItem(product: demoProducts[0], numOfItem: 2),
  CartItem(product: demoProducts[1], numOfItem: 1),
  CartItem(product: demoProducts[3], numOfItem: 1),
];
