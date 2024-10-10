import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/component/country_code.dart';
import 'package:flutter_setup/global/component/country_item.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  static EditProfileController get to => Get.find();

  Rx<File> selectedFile = File("").obs;
  RxString networkImg = "".obs;
  RxBool isBtnDisabled = true.obs;

  late GlobalKey<FormState> editProfileFormKey;

  var emailController = TextEditingController(),
      firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      contactNumberController = TextEditingController(),
      countryCodeController = TextEditingController(),
      userNameController = TextEditingController(),
      homeAddressController = TextEditingController(),
      officeAddressController = TextEditingController();

  var countryList = <CountryItem>[].obs;
  Rx<CountryItem> selectedCont = CountryItem().obs;

  @override
  void onReady() {
    super.onReady();
    countryList.addAll(getCountryList().data!);
  }

  void editProfileValidation() async {
    if (editProfileFormKey.currentState!.validate()) {
      editProfileFormKey.currentState!.save();
      isBtnDisabled.value = false;
    } else {
      isBtnDisabled.value = true;
    }
  }

  void openCountryBottomSheet() {
    CountryCodePicker.openCountryBottomSheet(
        countrys: countryList,
        onSelect: (country) {
          countryCodeController.text = "+${country.phoneCode!}";
          selectedCont.value = country;
        });
  }

  Future<bool> onWillPopTap() async {
    return await Get.offAllNamed(Routes.dashboardScreen);
  }
}
