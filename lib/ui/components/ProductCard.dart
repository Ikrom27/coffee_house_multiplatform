import 'dart:ffi';

import 'package:flutter/cupertino.dart';

Widget ProductCard({
  required String label,
  required String imageUrl,
  required double price,
}) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 128,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
        ),
        Text(
            "\$${price.toString()}",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
        )
    ],),
  );
}