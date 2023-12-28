// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_course_/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final Function? updateProduct;
  List<Map<String, dynamic>>? products;

  ProductListPage({this.products, this.updateProduct, super.key});
  // {required this.products,
  // super.key}); // I had to add required which was suggested by flutter or i get error below
  //{The parameter 'products' can't have a value of 'null' because of its type, but the implicit default value is 'null'.
  //Try adding either an explicit non-'null' default value or the 'required'}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(products?[index]['image']),
          title: Text(products?[index]['title']),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProductEditPage(
                      product: products?[index],
                      updateProduct: updateProduct,
                      productIndex: index,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      itemCount: products?.length,
    );
  }
}
