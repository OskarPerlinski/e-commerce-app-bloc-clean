import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/order/entities/product_ordered.dart';
import 'package:e_commerce_app1/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrdereEntity productOrdereEntity;
  const ProductOrderedCard({
    super.key,
    required this.productOrdereEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productOrdereEntity.productTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Size - ',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                              children: [
                                TextSpan(
                                  text: productOrdereEntity.productSize,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text.rich(
                            TextSpan(
                              text: 'Color - ',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                              children: [
                                TextSpan(
                                  text: productOrdereEntity.productColor,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${productOrdereEntity.totalPrice}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<CartProductsDisplayCubit>()
                      .removeProduct(productOrdereEntity);
                },
                child: Container(
                  height: 23,
                  width: 23,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
