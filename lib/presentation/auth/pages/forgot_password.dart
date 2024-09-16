import 'package:e_commerce_app1/common/bloc/button/button_state.dart';
import 'package:e_commerce_app1/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/auth/usecases/send_password_email_reset.dart';
import 'package:e_commerce_app1/presentation/auth/pages/password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});

    final TextEditingController _emailCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      backgroundColor: AppColors.background,
      body: BlocProvider(
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
              AppNavigator.push(context, const PasswordResetEmail());
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            child: Column(
              children: [
                _siginText(context),
                const SizedBox(height: 20),
                _emailField(context),
                const SizedBox(height: 20),
                _continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Forgot Password',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          hintText: 'Enter Email',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: AppColors.secondBackground,
          filled: true),
    );
  }

  Widget _continueButton() {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
                usecase: SendPasswordResetEmailUseCase(),
                params: _emailCon.text 
              );
        },
        title: 'Continue',
      );
    });
  }
}
