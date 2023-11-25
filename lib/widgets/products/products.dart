import 'package:flutter/material.dart';

import 'package:flutter_course_/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    //square brackets make it optional
    print('[Products Widget] Constructor');
  }

  // Widget _buildProductItem(BuildContext context, int index) {
  //   return ProductCard(product, productIndex);
  // }

  Widget _buildProductList() {
    Widget productCard;
    if (products.isNotEmpty) {
      productCard = ListView.builder(
        // itemBuilder: _buildProductItem,
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCard = Container(
        //empty container with the text if it is empty
        child: const Center(
          child: Text('No Products found, Please add some'),
        ),
      );
    }

    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build');
    return _buildProductList();
  }
}
