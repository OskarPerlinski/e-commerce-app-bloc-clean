import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/presentation/home/widgets/categories.dart';
import 'package:e_commerce_app1/presentation/home/widgets/header.dart';
import 'package:e_commerce_app1/presentation/home/widgets/new_in.dart';
import 'package:e_commerce_app1/presentation/home/widgets/search_field.dart';
import 'package:e_commerce_app1/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 24),
              SearchField(),
              SizedBox(height: 24),
              Categories(),
              SizedBox(height: 24),
              TopSelling(),
              SizedBox(height: 24),
              NewIn()
            ],
          ),
        ),
      ),
    );
  }
}
