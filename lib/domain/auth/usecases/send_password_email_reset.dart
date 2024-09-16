import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/domain/auth/repository/auth.dart';
import 'package:e_commerce_app1/service_locator.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either,String> {

  @override
  Future<Either> call({String ? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }

}