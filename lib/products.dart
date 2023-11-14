import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    //square brackets make it optional
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(products[index]['image']!),
        Text(
          products[index]['title']!,
          style: const TextStyle(color: Colors.white),
        ),
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          ElevatedButton(
            child: const Text('Details'),
            onPressed: () =>
                Navigator.pushNamed<bool>(context, '/product/$index'),
          ),
        ])
      ],
    ) //FlatButton Seems Deprecated so ElevatedButton Again
        );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.isNotEmpty) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
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
