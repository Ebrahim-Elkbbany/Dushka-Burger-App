import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:dushka_burger/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final VoidCallback onAddTap;

  const ProductListTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.w(20),
        vertical: context.h(8),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.w(12)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CustomCachedNetworkImage(
              imageUrl: imageUrl,
              width: context.w(80),
              height: context.h(70),
              fit: BoxFit.contain,
              radius: context.w(12),
            ),
          ),
          context.gapW(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.productName(context),
                ),
                context.gapH(4),
                Text(
                  "$price ${getLang(context, "currency")}",
                  style: AppTextStyles.productPrice(context),
                ),
              ],
            ),
          ),
          context.gapW(12),
          InkWell(
            onTap: onAddTap,
            child: Container(
              width: context.w(35),
              height: context.w(35),
              decoration: const BoxDecoration(
                color: AppColors.primaryRed,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white, size: context.sp(24)),
            ),
          ),
        ],
      ),
    );
  }
}
