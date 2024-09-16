import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app1/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmail extends StatelessWidget {
  const PasswordResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(
            height: 30,
          ),
          _sentEmail(),
          const SizedBox(
            height: 30,
          ),
          _returnToLoginButton(context)
        ],
      ),
    );
  }

  Widget _emailSending() {
    return Center(
      child: SvgPicture.asset(AppVectors.emailSending),
    );
  }

  Widget _sentEmail() {
    return const Center(
      child: Text(
        'We Sent you an Email to reset your password.',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.pushReplacement(context, Signin());
        },
        width: 200,
        title: 'Return to Login');
  }
}
