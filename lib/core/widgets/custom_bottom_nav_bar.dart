import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:dushka_burger/core/theming/font_styles.dart';
import 'package:dushka_burger/core/utils/app_locale.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(100),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: context.h(70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.w(20)),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  context,
                  Icons.home_outlined,
                  getLang(context, "home"),
                  false,
                ),
                _navItem(
                  context,
                  Icons.menu_book,
                  getLang(context, "menu"),
                  true,
                ),
                context.gapW(40),
                _navItem(
                  context,
                  Icons.percent,
                  getLang(context, "offers"),
                  false,
                ),
                _navItem(
                  context,
                  Icons.person_outline,
                  getLang(context, "account"),
                  false,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: context.w(60),
              height: context.w(60),
              decoration: BoxDecoration(
                color: AppColors.primaryBrown,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.backgroundBeige, width: 4),
              ),
              child: Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
                size: context.sp(26),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? AppColors.primaryBrown : AppColors.gray,
          size: context.sp(24),
        ),
        Text(
          label,
          style: AppTextStyles.bottomNavBarLabel(
            context,
            isSelected: isSelected,
          ),
        ),
      ],
    );
  }
}
