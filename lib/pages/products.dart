// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
  late final List<Map<String, dynamic>> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ]),
      ),
      appBar: AppBar(
        title: const Text('EasyList'),
        actions: [IconButton(icon: Icon(Icons.favorite), onPressed: () {})],
      ),
      body: ProductManager(
          products), // startingProduct: 'Food Tester' => can use name argument or default as it is now
    );
  }
}
