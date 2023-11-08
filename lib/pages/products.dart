import 'package:flutter/material.dart';
import 'package:flutter_course_/pages/products_admin.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsAdminPage()));
            },
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
