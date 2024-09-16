import 'package:e_commerce_app1/common/helper/bottomshhet/app_bottomsheet.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/product_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_size_selection_cubit.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedSize({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value:BlocProvider.of<ProductSizeSelectionCubit>(context),
            child: ProductSizes(productEntity: productEntity,)
          )
        );
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Size',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                  BlocBuilder<ProductSizeSelectionCubit,int>(
                  builder: (context, state) =>  Text(
                    productEntity.sizes[state],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}