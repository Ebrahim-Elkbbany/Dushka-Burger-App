import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:flutter/material.dart';

class AddonItemRow extends StatelessWidget {
  final String name;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const AddonItemRow({
    required this.name,
    required this.price,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: context.h(8)),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppColors.primaryRed : AppColors.gray,
            ),
            context.gapW(10),
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.productName(
                  context,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              price,
              style: AppTextStyles.productName(
                context,
              ).copyWith(color: AppColors.gray, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
