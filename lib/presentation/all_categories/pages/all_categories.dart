import 'package:e_commerce_app1/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commerce_app1/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/presentation/category_products/pages/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/images/image_display.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shopByCategories(),
              const SizedBox(
                height: 10,
              ),
              _categories()
            ],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories() {
    return const Text(
      'Shop by Categories',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesLoaded) {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () {
                      AppNavigator.push(
                        context,
                        CategoryProductsPage(
                          categoryEntity: state.categories[index],
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(ImageDisplayHelper
                                        .generateCategoryImageURL(
                                            state.categories[index].image)))),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            state.categories[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: state.categories.length);
        }
        return Container();
      },
    );
  }
}
