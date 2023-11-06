import 'package:flutter/material.dart';
import 'package:flutter_course_/products_manager.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,// to stop from top left not center
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          Container(padding: EdgeInsets.all(10.0), child: Text(title)),
          Container(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                  child: Text('Back'),
                  onPressed: () => Navigator.pop(context))),
        ],
      ),

      // Center(child: Text('On the Product Page')),
    );
  }
}
