import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/order/entities/product_ordered.dart';
import 'package:e_commerce_app1/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:e_commerce_app1/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:e_commerce_app1/presentation/cart/widgets/check_out.dart';
import 'package:e_commerce_app1/presentation/cart/widgets/product_ordered_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const BasicAppbar(
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty ? Center(child: _cartIsEmpty()) : Stack(
                children: [
                  _products(state.products),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CheckOut(
                      products: state.products,
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrdereEntity> products) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrdereEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppVectors.bagLogo,
          height: 100,
          width: 100,
        ),
        const Padding(padding: EdgeInsets.all(16),
        child: Text(
          'Cart is empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        )
      ],
    );
  }

}
