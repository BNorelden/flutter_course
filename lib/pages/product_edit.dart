// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function? addProduct;
  final Function? updateProduct;
  final Map<String, dynamic>? product;
  final int? productIndex;

  const ProductEditPage(
      {this.addProduct,
      this.updateProduct,
      this.product,
      this.productIndex,
      super.key});
//https://stackoverflow.com/questions/70905837/adding-an-explicit-non-null-default-value-to-parameters-in-flutter saved the day with question marks on varibles ^^^
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter the product title',
          icon: Icon(Icons.label)),
      // autovalidateMode: AutovalidateMode.always,//this is always showing
      initialValue: widget.product == null ? '' : widget.product?['title'],
      validator: (String? value) {
        // if (value!.trim().length <= 0) {
        if (value!.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long.';
        }
      },
      onSaved: (String? value) {
        //? saved the day for The argument type 'void Function(String)' can't be assigned to the parameter type 'void Function(String?)?'

        _formData['title'] = value!;
      },
/*         onChanged: (String value) {//works now but will use onSaved for learning Purposes
          setState(() {
            _titleValue = value;
          });
        } */
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Enter the description(max lines is 4)',
        icon: Icon(Icons.description),
      ),
      initialValue:
          widget.product == null ? '' : widget.product?['description'],
      validator: (String? value) {
        // if (value!.trim().length <= 0) {
        if (value!.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ characters long.';
        }
      },
      minLines: 2,
      maxLines: 5,
      onSaved: (String? value) {
        //? saved the day for The argument type 'void Function(String)' can't be assigned to the parameter type 'void Function(String?)?'

        _formData['description'] = value!;
      },
/*       onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      }, */
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
      initialValue:
          widget.product == null ? '' : widget.product?['price'].toString(),
      validator: (String? value) {
        if (value!.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
      onSaved: (String? value) {
        _formData['price'] = double.parse(value!);
      },
/*       onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      }, */
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState
        ?.save(); //The method 'save' can't be unconditionally invoked because the receiver can be 'null'.
    // Try making the call conditional (using '?.') or adding a null check to the target ^^++
    if (widget.product == null) {
      widget.addProduct!(_formData);
    } else {
      widget.updateProduct!(widget.productIndex, _formData);
    }

    Navigator.pushReplacementNamed(
        context, '/products'); //takes you to products page
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
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
                      textStyle:
                          const TextStyle(color: Colors.deepPurpleAccent)),
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
      ),
    );
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
