import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app1/domain/auth/repository/auth.dart';
import 'package:e_commerce_app1/service_locator.dart';

class SigninUseCase implements UseCase<Either,UserSigninReq> {


  @override
  Future<Either> call({UserSigninReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

  
}