import 'package:flutter/material.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

/// This is common App button that will be used in all places where it should be match the app theme
class AppButton extends StatelessWidget {
  final double? verticlePadding;
  final Color? btnBgColor, borderColor;
  final VoidCallback? onTap;
  final String? btnText;
  final TextStyle? buttonTextStyle;

  const AppButton(
      {Key? key,
      this.verticlePadding,
      this.buttonTextStyle,
      this.borderColor,
      this.btnBgColor,
      this.btnText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        minWidth: double.infinity,
        color: btnBgColor ?? AppColors.kcYellow,
        padding: EdgeInsets.symmetric(vertical: verticlePadding ?? 15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor ?? AppColors.kcTransparent)),
        child: Text(
            textAlign: TextAlign.center,
            btnText.toString(),
            style: buttonTextStyle ?? AppStyles.txt14sizeW700ColorPrimary));
  }
}
