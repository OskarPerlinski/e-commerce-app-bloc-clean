import 'package:e_commerce_app1/common/bloc/button/button_state.dart';
import 'package:e_commerce_app1/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app1/domain/auth/usecases/signup.dart';
import 'package:e_commerce_app1/presentation/auth/pages/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ButtonStateCubit(),
            )
          ],
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _siginText(context),
                  const SizedBox(height: 20),
                  _firstNameField(context),
                  const SizedBox(height: 20),
                  _lastNameField(context),
                  const SizedBox(height: 20),
                  _emailField(context),
                  const SizedBox(height: 20),
                  _passwordField(context),
                  const SizedBox(height: 20),
                  _finishButton(context),
                  const SizedBox(height: 20),
                  _createAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: _firstNameCon,
      decoration: const InputDecoration(
          hintText: 'First Name',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: AppColors.secondBackground,
          filled: true),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: _lastNameCon,
      decoration: const InputDecoration(
          hintText: 'Last Name',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: AppColors.secondBackground,
          filled: true),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: _emailCon,
      decoration: const InputDecoration(
          hintText: 'Enter Email',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: AppColors.secondBackground,
          filled: true),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      controller: _passwordCon,
      decoration: const InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: AppColors.secondBackground,
          filled: true),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
              onPressed: () {
                context.read<ButtonStateCubit>().execute(
                    usecase: SignupUseCase(),
                    params: UserCreationReq(
                        firstname: _firstNameCon.text,
                        lastname: _lastNameCon.text,
                        email: _emailCon.text,
                        password: _passwordCon.text));
              },
              title: 'Finish');
        }),
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Do you have an account? ',
          ),
          TextSpan(
            text: 'Sign in',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  Signin(),
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
