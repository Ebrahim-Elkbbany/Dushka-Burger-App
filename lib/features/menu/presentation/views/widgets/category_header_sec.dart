import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/top_category_tabs.dart';
import 'package:flutter/material.dart';

class CategoryHeaderSection extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onTabChanged;

  const CategoryHeaderSection({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCategoryTabs(
          selectedIndex: selectedIndex,
          onTabChanged: onTabChanged,
        ),
        context.gapH(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.w(20)),
          child: Text(
            selectedIndex == 0 
                ? getLang(context, "dushka_offers") 
                : getLang(context, "app_offers"),
            style: AppTextStyles.sectionTitle(context),
          ),
        ),
      ],
    );
  }
}