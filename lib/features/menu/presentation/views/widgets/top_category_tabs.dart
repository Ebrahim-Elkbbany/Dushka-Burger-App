import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/features/menu/domain/entities/category_entity.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/category_list_view_item.dart';
import 'package:flutter/material.dart';

class TopCategoryTabs extends StatelessWidget {
  final List<CategoryEntity> categories;
  final int selectedIndex;
  final Function(int) onTabChanged;

  const TopCategoryTabs({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return SizedBox(
      height: context.h(40),
      child: ListView.separated(
        itemBuilder: (context, index) => CategoryListViewItem(
          text: categories[index].nameEn,
          isSelected: selectedIndex == index,
          icon: Icons.fastfood,
          onTap: () => onTabChanged(index),
        ),
        separatorBuilder: (context, index) => context.gapW(10),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
