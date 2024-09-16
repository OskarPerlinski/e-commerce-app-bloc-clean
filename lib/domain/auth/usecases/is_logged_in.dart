import 'package:e_commerce_app1/core/usecases/usecase.dart';
import 'package:e_commerce_app1/domain/auth/repository/auth.dart';
import 'package:e_commerce_app1/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
    }


  

  
}