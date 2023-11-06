import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './pages/home.dart';

// main() {
//   runApp(MyApp());
// } // which is the same as below but using anonymous function

main() => runApp(MyApp());

// void main() {
//   //pretty useful UI for debugging
//   // debugPaintSizeEnabled = true;
//   // debugPaintBaselinesEnabled = true;
//   // debugPaintPointersEnabled = true;
//   runApp(MyApp());
// }

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
        // debugShowMaterialGrid: true, //  for debug purpose the whole screen becomes minipixelated squares
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          // accentColor: Colors.deepPurple, // is deprecated so will comment it for now
          cardColor:
              Colors.deepPurple, //did this instead of the accentColor for now
        ),
        home: HomePage());
  }
}
