import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct; //how to get this from point a

  ProductManager(this.startingProduct) {
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

  @override
  Widget build(BuildContext context) {
    print('[ProductsManager State] build()');
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            //replaced RaisedButton since it is deprecated already https://stackoverflow.com/questions/53531830/the-methods-raisedbutton-isnt-defined
            onPressed: () {
              setState(() {
                _products.add('Advanced Food Tester');
                // print(_products);
              });
            },
            child: const Text('Add Product'),
          ),
        ),
        Products(_products)
      ],
    );
  }
}
