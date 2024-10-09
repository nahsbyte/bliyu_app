/*
 * Copyright (c) 2023 Technource. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *  Email: support@technource.com
 *  Developed by Technource (https://www.technource.com)
 */

import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:flutter_setup/src/views/setting_page/components/more_screen/model/more_menu_model.dart';
import 'package:get/get.dart';

class MoreScreenController extends GetxController {
  var moreMenuList = <MoreMenuModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    moreMenuList.addAll(getMoreMenu());
  }

  Future<void> selectMoreScreenItem({required MoreMenuModel item}) async {
    switch (item.id) {
      case 1:
        toWebScreen(slug: Config.cmsAboutUsUrl);
        break;
      case 2:
        toWebScreen(slug: Config.cmsTermsCondition);
        break;
      case 3:
        toWebScreen(slug: Config.cmsPrivacyPolicy);
        break;
      default:
        Logger.logPrint("default");
        break;
    }
  }

  toWebScreen({required String slug}) {
    Get.toNamed(Routes.termsPrivacyScreen, arguments: [
      {Config.argSlug: slug}
    ]);
  }
}
