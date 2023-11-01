import 'package:flutter/material.dart';

import './products_manager.dart';

// main() {
//   runApp(MyApp());
// } // which is the same as below but using anonymous function
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// } // was using StatelessWidget till vid 2_13 starting using StatefulWidget and MyApp class is being changed
  // Commented what was needed to make it stateful because of vid 2.17 new class made it main stateless

// class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        // accentColor: Colors.deepPurple, // is deprecated so will comment it for now
        cardColor:
            Colors.deepPurple, //did this instead of the accentColor for now
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EasyList'),
        ),
        body:
            ProductManager(), // startingProduct: 'Food Tester' => can use name argument or default as it is now
      ),
    );
  }
}
