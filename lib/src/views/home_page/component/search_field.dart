import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class CommonSearchBar extends StatelessWidget {
  final GestureTapCallback? onPrefixTap;
  final Widget? prefix;
  final GestureTapCallback? onSuffixTap;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? editingComplete;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const CommonSearchBar(
      {Key? key,
      this.onFieldSubmitted,
      this.prefix,
      this.controller,
      this.editingComplete,
      this.onPrefixTap,
      this.onSuffixTap,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.done,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: editingComplete,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: R.strings.ksSearchText,
            contentPadding: const EdgeInsets.only(right: 9, top: 9, bottom: 9),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            suffixIcon: IconButton(
                onPressed: onSuffixTap,
                icon: Image.asset(AppAssets.icSearchIcon,
                    height: Get.width * 0.05)),
            prefixIcon: IconButton(
                onPressed: onPrefixTap,
                icon: const Icon(Icons.arrow_back_ios_new,
                    size: 20, color: AppColors.kcBlack)),
            errorMaxLines: 2));
  }
}
