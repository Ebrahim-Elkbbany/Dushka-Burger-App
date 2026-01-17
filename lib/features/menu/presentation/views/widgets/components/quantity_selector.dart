import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(context, Icons.remove, onDecrement),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(16)),
          child: Text("$quantity", style: AppTextStyles.sectionTitle(context)),
        ),
        _buildButton(context, Icons.add, onIncrement),
      ],
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.w(32),
        height: context.w(32),
        decoration: BoxDecoration(
          color: icon == Icons.add ? AppColors.primaryRed : Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: icon == Icons.add ? AppColors.white : AppColors.black,
          size: context.sp(18),
        ),
      ),
    );
  }
}
