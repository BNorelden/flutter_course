// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('Back button pressed!');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,// to stop from top left not center
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Text(
                title,
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Text('Jersey City, New Jersey',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                        )),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          ' | ',
                          style: TextStyle(color: Colors.grey),
                        )),
                    Text('\$$price',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          color: Colors.grey,
                          fontSize: 16.0,
                        )),
                  ]),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
