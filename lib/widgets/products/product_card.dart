import 'package:flutter/material.dart';

import 'location_tag.dart';
import 'price_tag.dart';
import '../ui_elements/title_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: const EdgeInsets.only(top: 15.0), // or SizedBox(15.0)
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TitleTag(product['title']),
        const SizedBox(width: 10.0),
        PriceTag(product['price'].toString()),
      ]),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
        tooltip: 'Details',

        // child: const Text('Details'),
        onPressed: () =>
            Navigator.pushNamed<bool>(context, '/product/$productIndex'),
      ),
      IconButton(
        icon: const Icon(Icons.favorite_border),
        color: Colors.red,
        tooltip: 'Favorite This?',
        onPressed: () =>
            Navigator.pushNamed<bool>(context, '/product/$productIndex'),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(product['image']!),
        _buildTitlePriceRow(),
        LocationTag('Jersey City, New Jersey'),
        _buildActionButtons(context),
      ],
    ));
  }
}
