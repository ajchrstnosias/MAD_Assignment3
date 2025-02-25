import 'package:flutter/material.dart';
import 'package:osias_assignment3/models/cart.dart';
import 'package:osias_assignment3/models/productprovider.dart';
import 'package:osias_assignment3/screens/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      builder: (context, child) => MaterialApp(home: ProductScreen()),
    );
  }
}
