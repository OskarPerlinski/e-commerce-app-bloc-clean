import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductPrice({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "\$${productEntity.discountedPrice != 0 ? productEntity.discountedPrice.toString() : productEntity.price.toString()}",
        style: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
