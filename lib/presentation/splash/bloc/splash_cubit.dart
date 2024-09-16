import 'package:e_commerce_app1/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce_app1/presentation/splash/bloc/splash_state.dart';
import 'package:e_commerce_app1/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(
        seconds: 4,
      ),
    );
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
    emit(UnAuthenticated());
  }
}
