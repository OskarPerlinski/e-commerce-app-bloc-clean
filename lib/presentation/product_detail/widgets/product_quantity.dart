import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductQuantity({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Quantity',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().decrement();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primary),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) => Text(
                  state.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().increment();
                },
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
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
