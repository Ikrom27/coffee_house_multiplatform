import 'package:coffee_house/data/Models.dart';
import 'package:coffee_house/ui/components/Buttons.dart';
import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductPageState();
  }
}

class _ProductPageState extends State<ProductInfoPage> {
  ProductSize _size = ProductSize.small;

  void _changeSize(ProductSize size){
    setState(() {
      _size = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.85,
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
            ],
          ),
        ),
      ),
    );
  }
}
