import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';

/// To customize the app theme need to changes things in this method
ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      splashColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.kcCaptionLightGray),
      primaryColor: AppColors.kcPrimaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      dividerColor: AppColors.kcPrimaryAccentColor.withOpacity(0.1),
      focusColor: AppColors.kcPrimaryAccentColor,
      hintColor: AppColors.kcDefaultText,
      colorScheme: const ColorScheme.light(
          primary: AppColors.kcPrimaryColor,
          secondary: AppColors.kcPrimaryColor),
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme));
}
