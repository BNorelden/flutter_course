import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct; //how to get this from point a

  ProductManager({this.startingProduct = 'Sweets Tester'}) {
    //name argument or default = Sweets Tester
    print('[ProductsManager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductsManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    print('[ProductsManager State] initState()');

    _products.add(widget.startingProduct); //to point b using widget
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductManager oldWidget) {
    print(
        '[ProductsManager State] didUpdateWidget()'); //didn't show up in the debug console :(
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
      print(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductsManager State] build()');
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Products(
            _products) // _products would make it empty since I made products empty []
      ],
    );
  }
}
