import 'package:dushka_burger/core/extensions/size_config_extension.dart';
import 'package:dushka_burger/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextStyles {
  

  static TextStyle sectionTitle(BuildContext context) => GoogleFonts.cairo(
        fontSize: context.sp(18),
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      );


  static TextStyle productName(BuildContext context) => GoogleFonts.cairo(
        fontSize: context.sp(14),
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        height: 1.2, 
      );


  static TextStyle productPrice(BuildContext context) => GoogleFonts.cairo(
        fontSize: context.sp(16),
        fontWeight: FontWeight.w900, // ExtraBold
        color: Colors.black,
      );


  static TextStyle tabSelected(BuildContext context) => GoogleFonts.cairo(
        fontSize: context.sp(13),
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      );


  static TextStyle tabUnselected(BuildContext context) => GoogleFonts.cairo(
        fontSize: context.sp(13),
        fontWeight: FontWeight.bold,
        color: AppColors.primaryRed,
      );


  static TextStyle bottomNavBarLabel(BuildContext context, {required bool isSelected}) => 
      GoogleFonts.cairo(
        fontSize: context.sp(11),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        color: isSelected ? AppColors.primaryBrown : AppColors.gray,
      );
}