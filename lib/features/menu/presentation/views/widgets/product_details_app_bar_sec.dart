import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:flutter/material.dart';

AppBar productDetailsAppBar(BuildContext context) => AppBar(
  leading: Row(
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  ),
  title: Text(
    getLang(context, "product_details"),
    style: AppTextStyles.sectionTitle(context),
  ),
  actions: [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w(16)),
      child: Icon(
        Icons.shopping_basket_outlined,
        color: AppColors.primaryRed,
        size: context.sp(24),
      ),
    ),
  ],
);
