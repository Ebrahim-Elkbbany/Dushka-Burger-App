import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:flutter/material.dart';

class TopCategoryTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const TopCategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.w(16)),
      child: Row(
        children: [
          _buildTab(
            context: context,
            text: getLang(context, "dushka_offers"),
            isSelected: selectedIndex == 0,
            icon: Icons.fastfood,
            onTap: () => onTabChanged(0),
          ),
          context.gapW(10),
          _buildTab(
            context: context,
            text: getLang(context, "app_offers"),
            isSelected: selectedIndex == 1,
            icon: Icons.local_offer,
            onTap: () => onTabChanged(1),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required BuildContext context,
    required String text,
    required bool isSelected,
    required IconData icon,
    required VoidCallback onTap,
  }) {
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
          color: isSelected ? AppColors.primaryRed : Colors.white,
          borderRadius: BorderRadius.circular(context.w(25)),
          border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: context.w(12),
              backgroundColor: Colors.white,
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
