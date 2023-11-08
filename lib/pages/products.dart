import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
  late final List<Map<String, String>> products;
  late final Function addProduct;
  late final Function deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Choose'),
          ),
          ListTile(
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ]),
      ),
      appBar: AppBar(
        title: const Text('EasyList'),
      ),
      body: ProductManager(products, addProduct,
          deleteProduct), // startingProduct: 'Food Tester' => can use name argument or default as it is now
    );
  }
}
