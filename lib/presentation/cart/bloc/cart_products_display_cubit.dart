import 'package:e_commerce_app1/domain/order/entities/product_ordered.dart';
import 'package:e_commerce_app1/domain/order/usecases/get_cart_products.dart';
import 'package:e_commerce_app1/domain/order/usecases/remove_cart_product.dart';
import 'package:e_commerce_app1/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:e_commerce_app1/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedDate = await sl<GetCartProductsUseCase>().call();

    returnedDate.fold(
      (error) {
        emit(
          LoadCartProductsFailure(),
        );
      },
      (data) {
        emit(
          CartProductsLoaded(products: data),
        );
      },
    );
  }
  void removeProduct(ProductOrdereEntity product) async {
    emit(CartProductsLoading());
     var returnedData = await sl<RemoveCartProductUseCase>().call(
      params: product.id
     );
    returnedData.fold(
      (error) {
        emit(
          LoadCartProductsFailure(),
        );
      },
      (data) {
        displayCartProducts();
      },
    );
  }
}
