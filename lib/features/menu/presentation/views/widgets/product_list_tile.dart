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
          CustomCachedNetworkImage(
            imageUrl: imageUrl,
            width: context.w(80),
            height: context.h(80),
            fit: BoxFit.contain,
            radius: context.w(16),
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
              width: context.w(25),
              height: context.w(25),
              decoration: const BoxDecoration(
                color: AppColors.primaryRed,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: AppColors.white,
                size: context.sp(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
