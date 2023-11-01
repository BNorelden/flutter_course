import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //replaced RaisedButton since it is deprecated already https://stackoverflow.com/questions/53531830/the-methods-raisedbutton-isnt-defined
      onPressed: () {
        addProduct('Sweets');
      },
      child: const Text('Add Product'),
    );
  }
}
