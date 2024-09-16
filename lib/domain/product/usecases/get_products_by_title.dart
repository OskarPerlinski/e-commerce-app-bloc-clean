import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/domain/product/repository/product.dart';
import 'package:e_commerce_app1/service_locator.dart';

class GetProductsByTitleUseCase implements UseCase<Either, String> {

  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByTitle(params!);
  }

}