import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/domain/order/repository/order.dart';
import 'package:e_commerce_app1/service_locator.dart';

class RemoveCartProductUseCase implements UseCase<Either, String> {

  @override
  Future<Either> call({String ? params}) async {
    return sl<OrderRepository>().removeCartProduct(params!);
  }

}