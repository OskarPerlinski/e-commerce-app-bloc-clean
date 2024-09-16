import 'package:e_commerce_app1/common/bloc/button/button_state.dart';
import 'package:e_commerce_app1/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app1/domain/auth/usecases/signin.dart';
import 'package:e_commerce_app1/presentation/auth/pages/forgot_password.dart';
import 'package:e_commerce_app1/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPassword extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPassword({super.key, required this.signinReq});

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  const Home(),
                );
              }
            },
            child: Column(
              children: [
                _siginText(context),
                const SizedBox(height: 20),
                _passwordField(context),
                const SizedBox(height: 20),
                _continueButton(context),
                const SizedBox(height: 20),
                _forgotPassword(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Enter Password',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: AppColors.secondBackground,
          filled: true),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          signinReq.password = _passwordCon.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SigninUseCase(), params: signinReq);
        },
        title: 'Continue',
      );
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Forgot password? ',
          ),
          TextSpan(
            text: 'Reset',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  ForgotPassword(),
                );
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
