import 'package:flutter/material.dart';
import 'products.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('LOGIN'),
          onPressed: () => {Navigator.pushReplacementNamed(context, '/')},
        ),
      ), // startingProduct: 'Food Tester' => can use name argument or default as it is now
    );
  }
}
