import 'package:e_commerce_app1/common/helper/images/image_display.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                ImageDisplayHelper.generateProductImageURL(productEntity.image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
