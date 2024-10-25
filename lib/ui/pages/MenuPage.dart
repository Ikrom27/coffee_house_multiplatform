
import 'package:coffee_house/test/ProductList.dart';
import 'package:coffee_house/ui/components/ProductCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/Models.dart';

class MenuPage extends StatelessWidget {
  static List<Product> products = ProductListTest().data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
        children: products.map((product) =>
          ProductCard(
              label: product.name,
              imageUrl: product.imageUrl,
              price: product.price)
        ).toList(),
      ),
    );
  }

}