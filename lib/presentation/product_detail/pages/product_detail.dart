import 'package:e_commerce_app1/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/product_images.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/product_price.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/product_quantity.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/product_title.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/selected_color.dart';
import 'package:e_commerce_app1/presentation/product_detail/widgets/selected_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuantityCubit(),
        ),
        BlocProvider(
          create: (context) => ProductColorSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizeSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ButtonStateCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const BasicAppbar(
          hideBack: false,
        ),
        bottomNavigationBar: AddToBag(productEntity: productEntity),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImages(productEntity: productEntity),
            const SizedBox(height: 20),
            ProductTitle(productEntity: productEntity),
            const SizedBox(height: 20),
            ProductPrice(productEntity: productEntity),
            const SizedBox(height: 20),
            SelectedSize(productEntity: productEntity),
            const SizedBox(height: 15),
            SelectedColor(productEntity: productEntity),
            const SizedBox(height: 20),
            ProductQuantity(productEntity: productEntity),
          ],
        ),
      ),
    );
  }
}
