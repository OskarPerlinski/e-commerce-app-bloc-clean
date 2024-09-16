import 'package:e_commerce_app1/common/bloc/button/button_state.dart';
import 'package:e_commerce_app1/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/helper/product/product_price.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app1/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_app1/domain/order/usecases/add_to_cart.dart';
import 'package:e_commerce_app1/domain/product/entities/product.dart';
import 'package:e_commerce_app1/presentation/cart/pages/cart.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:e_commerce_app1/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(context, const CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                usecase: AddToCartUseCase(),
                params: AddToCartReq(
                  productId: productEntity.productId,
                  productTitle: productEntity.title,
                  productQuantity: context.read<ProductQuantityCubit>().state,
                  productColor: productEntity
                      .colors[context
                          .read<ProductColorSelectionCubit>()
                          .selectedIndex]
                      .title,
                  productSize: productEntity.sizes[
                      context.read<ProductSizeSelectionCubit>().selectedIndex],
                  productPrice: productEntity.price.toDouble(),
                  totalPrice:
                      ProductPriceHelper.provideCurrentPrice(productEntity) *
                          context.read<ProductQuantityCubit>().state,
                  productImage: productEntity.image[0],
                  createdDate: DateTime.now().toString(),
                ));
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  var price =
                      ProductPriceHelper.provideCurrentPrice(productEntity) *
                          state;
                  return Text(
                    "\$${price.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  );
                },
              ),
              const Text(
                'Add to Bag',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
