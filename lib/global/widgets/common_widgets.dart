import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/assets.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../constant/resources/colors.dart';

//This is File is Contains created widgets which are used multiple times in all over project.

class BuildAvtarPlaceHolder extends StatelessWidget {
  final double width;
  final double height;
  const BuildAvtarPlaceHolder(
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Image.asset(AppAssets.defaultAvatar, fit: BoxFit.cover));
  }
}

class BuildLoaderPlaceHolder extends StatelessWidget {
  const BuildLoaderPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.height * 0.02,
        height: Get.height * 0.02,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [Colors.grey.shade100, AppColors.kcPrimaryColor],
        ));
  }
}

class BuildGreyDivider extends StatelessWidget {
  final double? opacity;
  const BuildGreyDivider({Key? key, this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: AppColors.kcCaptionLightGray.withOpacity(opacity ?? 1),
        thickness: 2);
  }
}
