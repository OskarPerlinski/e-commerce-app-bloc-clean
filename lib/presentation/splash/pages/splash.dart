import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/presentation/auth/pages/signin.dart';
import 'package:e_commerce_app1/presentation/home/pages/home.dart';
import 'package:e_commerce_app1/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce_app1/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(
            context,
            Signin(),
          );
        }

        if (state is Authenticated) {
          AppNavigator.pushReplacement(
            context,
            const Home(),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo,
          ),
        ),
      ),
    );
  }
}
