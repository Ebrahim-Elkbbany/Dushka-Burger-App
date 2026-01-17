import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/components/addon_item_row.dart';
import 'package:flutter/material.dart';

class AddonGroupSection extends StatelessWidget {
  final String title;
  final bool isRequired;
  final List<AddonOption> options;

  const AddonGroupSection({
    required this.title,
    required this.isRequired,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: AppTextStyles.sectionTitle(context),
            children: isRequired
                ? [
                    TextSpan(
                      text: " *",
                      style: AppTextStyles.sectionTitle(
                        context,
                      ).copyWith(color: AppColors.primaryRed),
                    ),
                  ]
                : [],
          ),
        ),
        context.gapH(10),
        ...options.map(
          (option) => AddonItemRow(
            name: option.name,
            price: option.price,
            isSelected: option.isSelected,
            onTap: () {
              // TODO: Handle selection
            },
          ),
        ),
      ],
    );
  }
}

class AddonOption {
  final String name;
  final String price;
  final bool isSelected;
  AddonOption(this.name, this.price, this.isSelected);
}
