import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        productEntity.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
      ),
    );
  }
}