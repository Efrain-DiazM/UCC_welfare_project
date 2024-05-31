// import 'package:app_mobile/modules/authentication/screens/login/login.dart';
// import 'package:app_mobile/modules/products/screens/list_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/login.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  // void dotNavigationClick(index) {
  //   currentPageIndex.value = index;
  //   pageController.jumpToPage(index);
  // }

  // void nextPage() {
  //   print(currentPageIndex);
  //   if (currentPageIndex.value == 0) {
  //     Get.to(const LoginScreen());
  //   } else {
  //     int page = currentPageIndex.value + 1;
  //     pageController.jumpToPage(page);
  //   }
  // }

  // void skipPage() {
  //   currentPageIndex.value = 2;
  //   pageController.jumpToPage(2);
  // }
}
