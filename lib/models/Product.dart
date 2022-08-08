import 'package:flutter/material.dart';
import 'package:fluidxtores/models/tags.dart';

class Product {
  final int? id;
  final String? title, description;
  final List<String?>? images;
  final List<Color>? colors;
  final double? rating;
  final String? price;
  final bool? isInStock;
  final String? regularPrice;
  final String? currency;
  final bool? isFavourite, isPopular;
  final String? fullDescription;
  final String? sku;
  final String? shortDescription;
  final List<Tags>? tags;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.tags,
    this.currency,
    this.isInStock,
    this.shortDescription,
    this.regularPrice,
    this.fullDescription,
    required this.title,
    required this.price,
    required this.description,
    this.sku,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: '64.99',
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: '50.5',
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: '36.55',
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "https://dibapant.com/wp-content/uploads/woocommerce-placeholder.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: '20.20',
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String? description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
