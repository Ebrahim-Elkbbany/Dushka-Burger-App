import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:flutter/material.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.w(25)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: context.w(15),
          vertical: context.h(8),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryRed
              : AppColors.primaryRed.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(context.w(25)),
          border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: context.w(12),
              backgroundColor: AppColors.white,
              child: Icon(
                icon,
                size: context.sp(14),
                color: AppColors.primaryRed,
              ),
            ),
            context.gapW(8),
            Text(
              text,
              style: isSelected
                  ? AppTextStyles.tabSelected(context)
                  : AppTextStyles.tabUnselected(context),
            ),
          ],
        ),
      ),
    );
  }
}
