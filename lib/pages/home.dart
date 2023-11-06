import 'package:flutter/material.dart';

import '../products_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyList'),
      ),
      body:
          ProductManager(), // startingProduct: 'Food Tester' => can use name argument or default as it is now
    );
  }
}
