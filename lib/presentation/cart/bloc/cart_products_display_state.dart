import 'package:e_commerce_app1/domain/order/entities/product_ordered.dart';

abstract class CartProductsDisplayState {}

class CartProductsLoading extends CartProductsDisplayState {}

class CartProductsLoaded extends CartProductsDisplayState {
  final List<ProductOrdereEntity> products;

  CartProductsLoaded({required this.products});
}

class LoadCartProductsFailure extends CartProductsDisplayState {}
