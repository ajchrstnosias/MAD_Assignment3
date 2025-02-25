import 'package:flutter/material.dart';
import 'package:osias_assignment3/models/cart.dart';
import 'package:osias_assignment3/models/productprovider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  var codeCtrl = TextEditingController();
  var nameCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CartProvider>(
      builder: (context, products, cartItems, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("View Products"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              IconButton(
                onPressed: () => showAddDialog(context),
                icon: Icon(Icons.add),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          body: ListView.builder(
            itemCount: products.count,
            itemBuilder: (context, index) {
              var product = products.items[index];
              return Dismissible(
                background: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.delete_outline, color: Colors.white),
                    ),
                  ),
                  color: Colors.red,
                ),
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) => doDelete(context, index),
                child: Card(
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () => products.toggleFav(index),
                      icon: Icon(
                        product.isFav ? Icons.favorite : Icons.favorite_border,
                      ),
                    ),
                    title: Text('${product.name} ${product.code}'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: codeCtrl,
                decoration: InputDecoration(label: Text('Code')),
              ),
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(label: Text('Name/Description')),
              ),
              TextField(
                controller: priceCtrl,
                decoration: InputDecoration(label: Text('Price')),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).add(
                  Product(
                    code: codeCtrl.text,
                    name: nameCtrl.text,
                    price: double.tryParse(priceCtrl.text) ?? 0,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void doDelete(BuildContext context, int i) {
    Provider.of<ProductProvider>(context, listen: false).deleteProduct(i);
  }
}
