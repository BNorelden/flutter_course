import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  late final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the title',
                  icon: Icon(Icons.label)),
              onChanged: (String value) {
                setState(() {
                  _titleValue = value;
                });
              },
            ),
            // Text(_titleValue), // This was just for debugging early on I believe
            TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter the description(max lines is 4)',
                icon: Icon(Icons.description),
              ),
              minLines: 2,
              maxLines: 5,
              onChanged: (String value) {
                setState(() {
                  _descriptionValue = value;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter the price',
                icon: Icon(Icons.monetization_on_sharp),
              ),
              onChanged: (String value) {
                setState(() {
                  _priceValue = double.parse(value);
                });
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.deepPurpleAccent)),
                onPressed: () {
                  final Map<String, dynamic> product = {
                    'title': _titleValue,
                    'description': _descriptionValue,
                    'price': _priceValue,
                    'image': 'assets/food.jpg'
                  };
                  widget.addProduct(product);
                  Navigator.pushReplacementNamed(
                      context, '/products'); //takes you to products page
                },
                child: const Text('Save'))
          ],
        ));
  }
}
