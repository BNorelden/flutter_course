import 'package:flutter/material.dart';
import './products.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('LOGIN'),
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductsPage()),
            )
          },
        ),
      ), // startingProduct: 'Food Tester' => can use name argument or default as it is now
    );
  }
}
