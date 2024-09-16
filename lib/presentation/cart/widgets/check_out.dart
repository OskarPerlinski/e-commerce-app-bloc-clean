import 'package:e_commerce_app1/common/helper/card/cart.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/order/entities/product_ordered.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  final List<ProductOrdereEntity> products;
  const CheckOut({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Subtotal',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            Text(
              '\$${CartHelper.calculateCartTotalSubtotal(products).toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            )
          ]),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shiping Cost',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$8',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$${CartHelper.calculateCartTotalSubtotal(products) + 8}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              )
            ],
          ),
          BasicAppButton(
            onPressed: () {},
            title: 'Checkout',
          )
        ],
      ),
    );
  }
}
