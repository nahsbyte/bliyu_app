import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class VectorDescriptionWidget extends StatelessWidget {
  final String imagePath, description;

  const VectorDescriptionWidget(
      {Key? key, required this.imagePath, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Get.height * 0.01),
      showForgotPasswordVector(),
      SizedBox(height: Get.height * 0),
      showForgotPasswordPara(),
      SizedBox(height: Get.height * 0.04)
    ]);
  }

  showForgotPasswordVector({component}) {
    return Container(
        height: Get.height * 0.4,
        width: Get.width * 0.7,
        margin: const EdgeInsets.only(),
        child: Image.asset(imagePath));
  }

  showForgotPasswordPara({component}) {
    return Text(description,
        style: AppStyles.txt14sizeW700ColorPrimary
            .copyWith(fontWeight: FontWeight.w500, color: AppColors.kcWhite),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
  }
}
