import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'pages/product.dart';
import 'pages/products.dart';
import 'pages/auth.dart';
import 'pages/products_admin.dart';

// main() {
//   runApp(MyApp());
// } // which is the same as below but using anonymous function

// main() => runApp(MyApp());

void main() {
  // debugPaintSizeEnabled = true;
  //pretty useful UI for debugging ^
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
} // was using StatelessWidget till vid 2_13 starting using StatefulWidget and MyApp class is being changed
// Commented what was needed to make it stateful because of vid 2.17 new class made it main stateless

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowMaterialGrid: true, //  for debug purpose the whole screen becomes minipixelated squares
        debugShowCheckedModeBanner:
            false, //removing banner in top left corner of the screen
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          // accentColor: Colors.deepPurple, // is deprecated so will comment it for now
          cardColor:
              Colors.deepPurple, //did this instead of the accentColor for now
        ),
        // home: AuthPage(),
        routes: {
          //named routes
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(_products),
          '/admin': (BuildContext context) =>
              ProductsAdminPage(_addProduct, _deleteProduct),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name!.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(
                  _products[index]['title']!,
                  _products[index]['image']!,
                  _products[index]['price'],
                  _products[index]['description']),
              // HAD TO ADD _products[index]['price'] to make it appear in the product.dart popup as well
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage(_products));
        });
  }
}
