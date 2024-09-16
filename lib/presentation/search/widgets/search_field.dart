import 'package:e_commerce_app1/common/bloc/products/product_display_cubit.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        style: const TextStyle(color: Colors.white,),
        controller: textEditingController,
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<ProductsDisplayCubit>().displayInitial();
          } else {
            context.read<ProductsDisplayCubit>().displayProducts(params: value);
          }
        },
        decoration: InputDecoration(
          fillColor: AppColors.secondBackground,
          filled: true,
            contentPadding: const EdgeInsets.all(12),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'search',
            hintStyle: const TextStyle(
              color: Colors.grey,
            )),
      ),
    );
  }
}
