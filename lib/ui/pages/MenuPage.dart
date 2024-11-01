
import 'package:coffee_house/data/AppRepository.dart';
import 'package:coffee_house/ui/components/ProductCard.dart';
import 'package:flutter/material.dart';

import '../UIItems.dart';


class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }

}

class _MenuPageState extends State<MenuPage>{
  static AppRepository repository = AppRepository();
  static List<Product> products = [];

  void updateProducts(List<Product> data){
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    repository
        .getMenuProducts()
        .then((data) {
      updateProducts(
          data.map((model) =>
              Product(
                name: model.name,
                price: model.price,
                description: model.description,
                imageUrl: model.imageUrl
            )
          ).toList()
      );
    });
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
        children: showContent(products, context),
      ),
    );
  }

  List<Widget> showContent(List<Product> data, BuildContext context){
    return data.map((product) =>
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/menu/info',
              arguments: product,
            );
          },
          child: ProductCard(
            label: product.name,
            imageUrl: product.imageUrl,
            price: product.price,
          ),
        ),
    ).toList();
  }
}



