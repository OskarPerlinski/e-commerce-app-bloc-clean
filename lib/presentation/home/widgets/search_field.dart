import 'package:e_commerce_app1/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app1/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app1/presentation/search/pages/search.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        
        readOnly: true,
        onTap: () {
          AppNavigator.push(context, const SearchPage());
        },
        decoration: InputDecoration(
          fillColor: AppColors.secondBackground,
          filled: true,
            contentPadding: const EdgeInsets.all(12),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'search',
            hintStyle: const TextStyle(
              color: Colors.grey,
            )),
      ),
    );
  }
}
