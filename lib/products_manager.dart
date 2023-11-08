// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductManager extends StatelessWidget {
  late final List<Map<String, String>> products; //List<Map<String, String>>
  late final Function addProduct; // Function
  late final Function deleteProduct; // Function

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductsManager State] build()');
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(
            child: Products(products,
                deleteProduct:
                    deleteProduct)) // _products would make it empty since I made products empty []
      ],
    );
  }
}
