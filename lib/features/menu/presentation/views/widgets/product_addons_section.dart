import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/components/addon_group_section.dart';
import 'package:flutter/material.dart';

class ProductAddonsSection extends StatelessWidget {
  final List<AddonGroupEntity> addonGroups;
  final List<int> selectedAddonIds;
  final Function(int) onAddonToggled;

  const ProductAddonsSection({
    super.key,
    required this.addonGroups,
    required this.selectedAddonIds,
    required this.onAddonToggled,
  });

  @override
  Widget build(BuildContext context) {
    if (addonGroups.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: addonGroups.map((group) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddonGroupSection(
              title: group.nameEn,
              isRequired: group.isRequired,
              options: group.items.map((item) {
                final isSelected = selectedAddonIds.contains(item.id);
                final priceText = double.tryParse(item.price) == 0
                    ? "0 EGP"
                    : "+ ${item.price} EGP";
                return AddonOption(
                  item.nameEn,
                  priceText,
                  isSelected,
                );
              }).toList(),
              onOptionTapped: (index) {
                final itemId = group.items[index].id;
                onAddonToggled(itemId);
              },
            ),
            context.gapH(20),
          ],
        );
      }).toList(),
    );
  }
}
