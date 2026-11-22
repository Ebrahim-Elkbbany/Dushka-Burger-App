import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';
import 'package:dushka_burger/features/menu/presentation/views/widgets/components/quantity_selector.dart';
import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductDetailsEntity product;
  final int quantity;
  final Function(int) onQuantityChanged;

  const ProductInfoSection({
    super.key,
    required this.product,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final price = product.onSale && product.salePrice != null
        ? product.salePrice!
        : product.price;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.nameEn,
          style: AppTextStyles.sectionTitle(context),
        ),
        context.gapH(16),
        Row(
          children: [
            Text("$price EGP", style: AppTextStyles.productPrice(context)),
            if (product.onSale && product.salePrice != null) ...[
              context.gapW(8),
              Text(
                "${product.price} EGP",
                style: AppTextStyles.productPrice(context).copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
            const Spacer(),
            QuantitySelector(
              quantity: quantity,
              onIncrement: () => onQuantityChanged(quantity + 1),
              onDecrement: () {
                if (quantity > 1) {
                  onQuantityChanged(quantity - 1);
                }
              },
            ),
          ],
        ),
        context.gapH(16),
        Divider(thickness: 10, color: AppColors.gray.withValues(alpha: 0.20)),
        context.gapH(16),
        Text(
          product.descriptionEn,
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
