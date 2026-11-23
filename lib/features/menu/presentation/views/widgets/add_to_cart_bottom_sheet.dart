import 'package:dushka_burger/core/di/service_locator.dart';
import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:dushka_burger/features/menu/domain/entities/cart_entity.dart';
import 'package:dushka_burger/features/menu/domain/entities/product_details_entity.dart';
import 'package:dushka_burger/features/menu/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final ProductDetailsEntity product;
  final int quantity;
  final List<int> selectedAddonIds;
  final List<AddonGroupEntity> addonGroups;
  final Function(int) onQuantityChanged;

  const AddToCartBottomSheet({
    super.key,
    required this.product,
    required this.quantity,
    required this.selectedAddonIds,
    required this.addonGroups,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.w(16)),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.w(20)),
          topRight: Radius.circular(context.w(20)),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: context.h(50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.w(12)),
              ),
            ),
            onPressed: () async {
              // Get selected addons
              final selectedAddons = <CartAddonEntity>[];
              for (final group in addonGroups) {
                for (final item in group.items) {
                  if (selectedAddonIds.contains(item.id)) {
                    selectedAddons.add(CartAddonEntity(
                      id: item.id,
                      name: item.nameEn,
                      price: item.price,
                    ));
                  }
                }
              }

              // Add to cart
              final cartCubit = CartCubit(
                getGuestIdUseCase: sl(),
                getCartUseCase: sl(),
                addToCartUseCase: sl(),
                deleteFromCartUseCase: sl(),
              );

              await cartCubit.addToCart(
                productId: product.id,
                quantity: quantity,
                addons: selectedAddons,
              );

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart')),
                );
                Navigator.pop(context);
              }
            },
            child: Text(
              getLang(context, "add_to_cart"),
              style: AppTextStyles.sectionTitle(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
