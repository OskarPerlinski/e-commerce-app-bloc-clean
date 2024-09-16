import 'package:e_commerce_app1/common/helper/images/image_display.dart';
import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:e_commerce_app1/presentation/product_detail/pages/product_detail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          ProductDetailPage(
            productEntity: productEntity,
          ),
        );
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      ImageDisplayHelper.generateProductImageURL(
                          productEntity.image),
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity.title,
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          productEntity.discountedPrice == 0
                              ? "${productEntity.price}\$"
                              : "${productEntity.discountedPrice}\$",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          productEntity.discountedPrice == 0
                              ? ''
                              : "${productEntity.price}\$",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
