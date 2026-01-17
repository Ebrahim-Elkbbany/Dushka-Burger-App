import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:flutter/material.dart';

class AddToCartBottomSheet extends StatelessWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(16)),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.w(20)),
          topRight: Radius.circular(context.w(20)),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: context.h(50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.w(12)),
              ),
            ),
            onPressed: () {},
            child: Text(
              getLang(context, "add_to_cart"),
              style: AppTextStyles.sectionTitle(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
