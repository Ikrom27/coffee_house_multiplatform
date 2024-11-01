
import 'package:coffee_house/data/AppRepository.dart';
import 'package:coffee_house/ui/components/ProductCard.dart';
import 'package:flutter/material.dart';


class MenuPage extends StatelessWidget {
  static AppRepository repository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 24,
        children: repository.getProducts().map((product) =>
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
        ).toList(),
      ),
    );
  }
}



