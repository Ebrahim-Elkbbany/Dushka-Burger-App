import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/top_category_tabs.dart';
import 'package:flutter/material.dart';

class CategoryHeaderSection extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int selectedIndex;
  final Function(int) onTabChanged;

  const CategoryHeaderSection({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCategoryTabs(
          categories: categories,
          selectedIndex: selectedIndex,
          onTabChanged: onTabChanged,
        ),
        context.gapH(15),
        if (selectedIndex < categories.length)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(20)),
            child: Text(
              categories[selectedIndex].nameEn,
              style: AppTextStyles.sectionTitle(context),
            ),
          ),
      ],
    );
  }
}