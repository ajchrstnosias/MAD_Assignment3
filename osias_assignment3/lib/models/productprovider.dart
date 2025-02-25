import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [
    Product(code: "Pro Max", name: "iPhone", price: 2000),
  ];

  List<Product> get items => _products;

  int get count => _products.length;

  void add(Product p) {
    _products.add(p);
    notifyListeners();
  }

  void toggleFav(int i) {
    _products[i].isFav = !_products[i].isFav;
    notifyListeners();
  }

  void deleteProduct(int i) {
    _products.removeAt(i);
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}

class Product {
  final String code;
  final String name;
  final double price;
  late bool isFav;

  Product({
    required this.code,
    required this.name,
    required this.price,
    this.isFav = false,
  });
}
