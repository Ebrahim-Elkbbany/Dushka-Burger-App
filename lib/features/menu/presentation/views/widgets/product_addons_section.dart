import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/components/addon_group_section.dart';
import 'package:flutter/material.dart';

class ProductAddonsSection extends StatelessWidget {
  const ProductAddonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddonGroupSection(
          title: "Fries", // Theoretically dynamic from API
          isRequired: true,
          options: [
            AddonOption("French Fries", "0 EGP", true), // Dynamic
            AddonOption("Upsize Fries", "+ 8.77 EGP", false),
            AddonOption("Loaded Fries", "+ 13.15 EGP", false),
          ],
        ),
        context.gapH(20),
        AddonGroupSection(
          title: "Sauce",
          isRequired: true,
          options: [
            AddonOption("BBQ", "0 EGP", true),
            AddonOption("Sweet Chili", "0 EGP", false),
            AddonOption("Thousand Island", "0 EGP", false),
          ],
        ),
        context.gapH(20),
        AddonGroupSection(
          title: "Soft Drink",
          isRequired: false,
          options: [
            AddonOption("Big Cola 360", "0 EGP", false),
            AddonOption("V Cola", "0 EGP", false),
          ],
        ),
      ],
    );
  }
}
