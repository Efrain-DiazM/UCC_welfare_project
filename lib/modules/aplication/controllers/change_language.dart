import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {

  Rx<String> locale = 'es'.obs;

  void changeLanguage(String language){
    print(language + " Language");
    locale.value = language;
    Get.updateLocale(Locale(language));
  }
}