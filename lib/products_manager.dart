import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['Food Tester'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
