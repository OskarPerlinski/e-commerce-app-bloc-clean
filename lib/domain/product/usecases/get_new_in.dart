import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/domain/product/repository/product.dart';
import 'package:e_commerce_app1/service_locator.dart';

class GetNewInUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getNewIn();
  }

}