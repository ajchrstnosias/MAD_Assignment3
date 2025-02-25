import 'package:flutter/material.dart';
import 'package:osias_assignment3/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cart = [];

  List get items => _cart;

  int get count => _cart.length;

  int get totalCount {
    int c = 0;
    _cart.forEach((i) {
      c += i.qty;
    });
    return c;
  }

  void addToCart(Cart i) {
    _cart.add(i);
    notifyListeners();
  }
}

class Cart {
  final Product product;
  final int qty;

  Cart({required this.product, this.qty = 1});
}
