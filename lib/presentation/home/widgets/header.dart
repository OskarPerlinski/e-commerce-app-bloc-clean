import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/core/configs/assets/app_images.dart';
import 'package:e_commerce_app1/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/domain/auth/entity/user.dart';
import 'package:e_commerce_app1/presentation/cart/pages/cart.dart';
import 'package:e_commerce_app1/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:e_commerce_app1/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
        left: 30,
        right: 30,
      ),
      child: BlocProvider(
        create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
            builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user),
                _logoImage(),
                _card(context),
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.profile,
          ),
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _logoImage() {
    return Container(
      height: 50,
      width: 100,
      decoration: const BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppVectors.appLogo,
        height: 40,
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          const CartPage(),
        );
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          AppVectors.bagLogo,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
