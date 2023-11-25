// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text('\$$price',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          )),
    );
  }
}
