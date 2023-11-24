import 'package:flutter/material.dart';

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
        Container(
          padding: const EdgeInsets.only(top: 15.0), // or SizedBox(15.0)
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              products[index]['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald',
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text('\$${products[index]['price'].toString()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )),
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: const Text('Jersey City, New Jersey',
              style: TextStyle(color: Colors.white)),
        ),
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            tooltip: 'Details',

            // child: const Text('Details'),
            onPressed: () =>
                Navigator.pushNamed<bool>(context, '/product/$index'),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Colors.red,
            tooltip: 'Favorite This?',
            onPressed: () =>
                Navigator.pushNamed<bool>(context, '/product/$index'),
          )
        ])
      ],
    ));
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
