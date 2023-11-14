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
  String titleValue = '';
  String descriptionValue = '';
  double priceValue = 0.0;

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
                  titleValue = value;
                });
              },
            ),
            Text(titleValue),
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
                  descriptionValue = value;
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
                  priceValue = double.parse(value);
                });
              },
            ),
            ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  final Map<String, dynamic> product = {
                    'title': titleValue,
                    'description': descriptionValue,
                    'price': priceValue,
                    'image': 'assets/food.jpg'
                  };
                  widget.addProduct(product);
                })
          ],
        ));
  }
}
