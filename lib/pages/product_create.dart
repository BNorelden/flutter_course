import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            child: const Text('Save'),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const Center(
                      child: Text('This is a Modal!'), // I assume modal = pojo
                    );
                  });
            }));
  }
}
