import 'package:coffee_house/ui/components/UIItems.dart';
import 'package:coffee_house/ui/components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/Models.dart';
import '../../providers/product_info_provider.dart';

class ProductInfoPage extends ConsumerStatefulWidget {
  const ProductInfoPage({super.key});

  @override
  ConsumerState<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends ConsumerState<ProductInfoPage> {
  ProductSize _size = ProductSize.small;

  void _changeSize(ProductSize size) {
    setState(() {
      _size = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 202,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Size",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizeButton(
                        isActive: _size == ProductSize.small,
                        onPressed: () {
                          _changeSize(ProductSize.small);
                        },
                        label: "Small",
                      ),
                      SizeButton(
                        isActive: _size == ProductSize.medium,
                        onPressed: () {
                          _changeSize(ProductSize.medium);
                        },
                        label: "Medium",
                      ),
                      SizeButton(
                        isActive: _size == ProductSize.large,
                        onPressed: () {
                          _changeSize(ProductSize.large);
                        },
                        label: "Large",
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      ref.read(productInfoNotifierProvider.notifier).addProductToCart(
                        ProductModel(
                          id: product.id,
                          name: product.name,
                          price: product.price,
                          description: product.description,
                          imageUrl: product.imageUrl,
                        ),
                      );
                    },
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

