// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_course_/widgets/products/location_tag.dart';
import 'package:flutter_course_/widgets/products/price_tag.dart';
import 'package:flutter_course_/widgets/ui_elements/title_tag.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  Widget _buildLocatonPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LocationTag('Jersey City, New Jersey'),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              ' | ',
              style: TextStyle(color: Colors.grey),
            )),
        PriceTag('$price')
      ],
    );
  }

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
            title: TitleTag(title),
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
              _buildLocatonPriceRow(),
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
