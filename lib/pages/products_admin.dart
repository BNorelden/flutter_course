// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_course_/pages/auth.dart';
import 'package:flutter_course_/pages/product_edit.dart';
import 'package:flutter_course_/pages/product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  const ProductsAdminPage(
      this.addProduct, this.updateProduct, this.deleteProduct, this.products,
      {super.key});

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Choose'),
        ),
        ListTile(
          leading: const Icon(Icons.shop_2),
          title: const Text('All Products'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/products');
          },
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, //dont forget to change this to 2 - 3 was for debugging
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Manage Products'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: 'Create Product',
            ),
            Tab(
              icon: Icon(Icons.list),
              text: 'My Products',
            ),
            Tab(
              //don't forget to remove this
              icon: Icon(Icons.login),
              text: 'authPageforDebugPurp',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct),
            ProductListPage(
              products: products,
              updateProduct: updateProduct,
            ), // he had products without being an empty array!!!!! but products: products worked for me
            AuthPage() //don't forget to remove this tab DONT KNOW HOW TO GET AUTH TO ALWAYS WORKKKKKK
          ],
        ),
      ),
    );
  }
}
