import 'package:coffee_house/data/AppRepository.dart';
import 'package:coffee_house/test/ProductList.dart';
import 'package:coffee_house/ui/components/ProductCard.dart';
import 'package:flutter/material.dart';

import '../UIItems.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }

}

class _CartPageState extends State<CartPage> {
  AppRepository repository = AppRepository();
  List<Product> _data = [];

  void updateData() async {
    List<Product> data = (await repository.getCartProducts())
        .map((model) =>
            Product(
                name: model.name,
                price: model.price,
                description: model.description,
                imageUrl: model.imageUrl
            )
    ).toList();
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    updateData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(children:
        _data.map((product) =>
            ProductCard(
                label: product.name,
                imageUrl: product.imageUrl,
                price: product.price)
        ).toList()
        ),
      ),
    );
  }
}