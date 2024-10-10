import 'package:flutter/material.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/component/country_code.dart';
import 'package:flutter_setup/global/component/country_item.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/utils/utils.dart';

class SignupScreenController extends GetxController {
  static SignupScreenController get to => Get.put(SignupScreenController());
  RxBool termAndConditionCheckBox = false.obs,
      isAcceptPolicy = false.obs,
      isPwdVisible = false.obs,
      isConPwdVisible = false.obs;
  var countryList = <CountryItem>[].obs;
  Rx<CountryItem> selectedCont = CountryItem().obs;

  late GlobalKey<FormState> createAccountFormKey;
  var firstNameTextEditingController = TextEditingController(),
      lastNameTextEditingController = TextEditingController(),
      emailTextEditingController = TextEditingController(),
      usernameTextEditingController = TextEditingController(),
      passwordTextEditingController = TextEditingController(),
      confirmPasswordTextEditingController = TextEditingController(),
      countryCodeController = TextEditingController(),
      contactNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    countryCodeController.text = '+32';
  }

  @override
  void onReady() {
    super.onReady();
    countryList.addAll(getCountryList().data!);
  }

  validAll() {
    if (createAccountFormKey.currentState!.validate()) {
      if (isAcceptPolicy.value == true) {
        Get.offAllNamed(Routes.loginScreen);
      } else {
        Utils.errorSnackBar(message: R.strings.ksAcceptTermAndConditionError);
      }
    } else {
      debugPrint('Invalidate');
    }
  }

  void openCountryBottomSheet() {
    CountryCodePicker.openCountryBottomSheet(
        countrys: countryList,
        onSelect: (country) {
          countryCodeController.text = '+${country.phoneCode!}';
          selectedCont.value = country;
        });
  }
}
