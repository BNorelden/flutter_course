import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
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
            title: Text('Manage Products'),
            onTap: () {},
          )
        ]),
      ),
      appBar: AppBar(
        title: const Text('EasyList'),
      ),
      body:
          ProductManager(), // startingProduct: 'Food Tester' => can use name argument or default as it is now
    );
  }
}
