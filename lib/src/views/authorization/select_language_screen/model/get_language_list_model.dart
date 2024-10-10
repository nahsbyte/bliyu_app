import 'package:flutter_setup/global/utils/config.dart';

class GetLanguageListModel {
  GetLanguageListModel({
    this.message,
    this.data,
    this.code,
  });

  GetLanguageListModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LanguageData.fromJson(v));
      });
    }
    code = json['code'];
  }

  String? message;
  List<LanguageData>? data;
  num? code;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    return map;
  }
}

class LanguageData {
  LanguageData({
    this.langId,
    this.langCode,
    this.langName,
  });

  LanguageData.fromJson(dynamic json) {
    langId = json['lang_id'];
    langCode = json['lang_code'];
    langName = json['lang_name'];
  }

  String? langId;
  String? langCode;
  String? langName;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lang_id'] = langId;
    map['lang_code'] = langCode;
    map['lang_name'] = langName;
    return map;
  }
}

List<LanguageData> getLanguages() {
  return [
    LanguageData(langId: '1', langName: 'English', langCode: Config.langCodeEn),
    LanguageData(langId: '2', langName: 'French', langCode: Config.langCodeFr),
    LanguageData(langId: '3', langName: 'Russian', langCode: Config.langCodeRu)
  ];
}
