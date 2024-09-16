import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_app1/domain/order/repository/order.dart';
import 'package:e_commerce_app1/service_locator.dart';

class AddToCartUseCase implements UseCase<Either,AddToCartReq> {

  @override
  Future<Either> call({AddToCartReq ? params}) async {
    return sl<OrderRepository>().addToCart(params!);
  }

}