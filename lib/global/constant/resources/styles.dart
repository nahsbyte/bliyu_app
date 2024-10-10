import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';

/// Definer text style,decoration style, card style in this file
class AppStyles {
  static const TextStyle txt18sizeW600White = TextStyle(
      color: AppColors.kcWhite, fontSize: 18, fontWeight: FontWeight.w600);

  static const TextStyle txt18sizeW600BlackColor = TextStyle(
      color: AppColors.kcDefaultText,
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static const TextStyle txt10sizeWithW700 = TextStyle(
      fontSize: 10,
      color: AppColors.kcPrimaryColor,
      fontWeight: FontWeight.bold);

  static const TextStyle txt14sizeW500CaptionLightGray = TextStyle(
      fontSize: 14,
      color: AppColors.kcCaptionLightGray,
      fontWeight: FontWeight.w500);

  static const txt14sizeW600ckcWhite = TextStyle(
      color: AppColors.kcWhite, fontSize: 14, fontWeight: FontWeight.w600);

  static const TextStyle txt14sizeW700ColorPrimary = TextStyle(
      fontSize: 14,
      color: AppColors.kcPrimaryColor,
      fontWeight: FontWeight.w700);

  static const txt16sizeW600CaptionLightGray = TextStyle(
      color: AppColors.kcCaptionLightGray,
      fontSize: 16,
      fontWeight: FontWeight.w600);

  static const txt24sizeW600kcCaptionLightGray = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.kcCaptionLightGray);
  static const txt32sizeWithW700 = TextStyle(
      fontSize: 32, color: AppColors.kcWhite, fontWeight: FontWeight.w700);
  static const txt14sizeWithW600Underline = TextStyle(
      fontSize: 14,
      color: AppColors.kcYellow,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
  static const txt12sizeW600ColorPrimary = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.kcPrimaryColor);
  static const txt10sizeWithW500 = TextStyle(
      fontSize: 10, color: AppColors.kcWhite, fontWeight: FontWeight.w700);
  static const txt18sizeWithW600 = TextStyle(
      fontSize: 18,
      color: AppColors.kcCaptionLightGray,
      fontWeight: FontWeight.w600);
  static const txtIntroTitle = TextStyle(
      fontSize: 28, color: AppColors.kcYellow, fontWeight: FontWeight.w700);

  //Home screen Style
  static const selectedLabelStyle = TextStyle(
      color: AppColors.kcCaptionLightGray,
      fontWeight: FontWeight.w600,
      fontSize: 10);

  static const txt14sizeWithW500HintGrey = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.hintColor);
}
