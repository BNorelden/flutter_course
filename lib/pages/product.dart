import 'package:flutter/material.dart';
import 'package:flutter_course_/products_manager.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('This action cannot be undone!'),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Discard')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  },
                  child: const Text('Continue')),
            ],
          );
        });
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
          title: Text(title),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,// to stop from top left not center
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(padding: const EdgeInsets.all(10.0), child: Text(title)),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    child: const Text('DELETE'),
                    onPressed: () => _showWarningDialog(context))),
          ],
        ),
        // Center(child: Text('On the Product Page')),
      ),
    );
  }
}
