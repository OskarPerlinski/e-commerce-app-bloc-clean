import 'package:e_commerce_app1/common/bloc/products/product_display_cubit.dart';
import 'package:e_commerce_app1/common/bloc/products/products_display_state.dart';
import 'package:e_commerce_app1/common/widgets/product/product_card.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:e_commerce_app1/domain/product/usecases/get_top_selling.dart';
import 'package:e_commerce_app1/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetTopSellingUseCase>())
            ..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topSelling(),
                const SizedBox(height: 20),
                _products(state.products)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _topSelling() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        'Top Selling',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> product) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(productEntity: product[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: product.length,
      ),
    );
  }
}
