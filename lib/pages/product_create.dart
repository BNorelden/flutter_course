// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  const ProductCreatePage(this.addProduct, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

  Widget _buildTitleTextField() {
    return TextFormField(
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Enter the title',
            icon: Icon(Icons.label)),
        onChanged: (String value) {
          setState(() {
            _titleValue = value;
          });
        });
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
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
    );
  }

  _buildPriceTextField() {
    return TextFormField(
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
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(
        context, '/products'); //takes you to products page
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Form(
        child: ListView(
          // LV takes the whole available space
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: [
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.deepPurpleAccent)),
                onPressed: _submitForm,
                child: const Text('Save'))
/*             GestureDetector(
              onTap: _submitForm,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(5.0),
                child: Text('My Button'),
              ),
            ) */
          ],
        ),
      ),
    );
  }
}
