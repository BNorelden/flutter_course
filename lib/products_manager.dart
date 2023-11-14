// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  late final List<Map<String, dynamic>> products; //List<Map<String, String>>

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    print('[ProductsManager State] build()');
    return Column(
      children: [Expanded(child: Products(products))],
    );
  }
}
