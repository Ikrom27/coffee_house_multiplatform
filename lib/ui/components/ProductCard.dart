import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Widget ProductCard({
  required String label,
  required String imageUrl,
  required int price,
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
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            )
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