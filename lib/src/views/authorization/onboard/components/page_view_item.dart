import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/styles.dart';
import 'package:flutter_setup/src/views/authorization/onboard/model/on_board_item_model.dart';

const ksWidgetVerticalSpace40 = 40.0;

class PageViewItem extends StatelessWidget {
  final OnBoardItemModel onBoardItemModel;

  const PageViewItem({Key? key, required this.onBoardItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Get.height * 0.03),
      Image.asset(onBoardItemModel.imgPath.toString(),
          height: Get.height * 0.4),
      const SizedBox(height: ksWidgetVerticalSpace40),
      Text(onBoardItemModel.title.toString(), style: AppStyles.txtIntroTitle),
      SizedBox(height: Get.height * 0.01),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: Text(onBoardItemModel.description.toString(),
              style: AppStyles.txt16sizeW600CaptionLightGray,
              textAlign: TextAlign.center))
    ]);
  }
}
