import 'package:dartz/dartz.dart';
import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app1/domain/auth/repository/auth.dart';
import 'package:e_commerce_app1/service_locator.dart';

class SignUpCase implements UseCase<Either,UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }

}