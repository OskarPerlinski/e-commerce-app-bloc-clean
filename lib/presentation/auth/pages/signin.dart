import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app1/presentation/auth/pages/enter_password.dart';
import 'package:e_commerce_app1/presentation/auth/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  Signin({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      backgroundColor: AppColors.background,
      body: Padding(
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
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
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

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          EnterPassword(
            signinReq: UserSigninReq(
              email: _emailCon.text,
            ),
          ),
        );
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't you have an account? ",
          ),
          TextSpan(
            text: 'Create one',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  Signup(),
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
