import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/components/quantity_selector.dart';
import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Juicy Dose Grand Box",
          style: AppTextStyles.sectionTitle(context),
        ),
        context.gapH(16),
        Row(
          children: [
            Text("225 EGP", style: AppTextStyles.productPrice(context)),
            Spacer(),
            QuantitySelector(
              quantity: 1,
              onIncrement: () {},
              onDecrement: () {},
            ),
          ],
        ),
        context.gapH(16),
        Divider(thickness: 10, color: AppColors.gray.withValues(alpha: 0.20)),
        context.gapH(16),
        Text(
          "Grand Juicy Dos Sandwich + Medium Fries + Sauce (Bbq, Thousand Island, or Sweet Chili)",
          style: AppTextStyles.productName(
            context,
          ).copyWith(fontWeight: FontWeight.normal),
        ),
        context.gapH(16),
        Divider(thickness: 10, color: AppColors.gray.withValues(alpha: 0.22)),
      ],
    );
  }
}
