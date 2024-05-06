import 'package:flutter_ucc_welfare_project/generated/app_localizations.dart';
import 'package:get/get.dart';

class AppText {
  AppText._();

  // Global texts

  // OnBoarding texts
  static String onBoardingTitle1 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingTitle1');
  // static String onBoardingTitle2 =
  //     AppLocalizations.of(Get.context!).onboarding('onBoardingTitle2');
  // static String onBoardingTitle3 =
  //     AppLocalizations.of(Get.context!).onboarding('onBoardingTitle3');

  static String onBoardingSubTitle1 =
      AppLocalizations.of(Get.context!).onboarding('onBoardingSubTitle1');
  // static String onBoardingSubTitle2 =
  //     AppLocalizations.of(Get.context!).onboarding('onBoardingSubTitle2');
  // static String onBoardingSubTitle3 =
  //     AppLocalizations.of(Get.context!).onboarding('onBoardingSubTitle3');

  static String onBoardingLogin =
      AppLocalizations.of(Get.context!).onboarding('onBoardingLogin');

  static String onBoardingRegister =
      AppLocalizations.of(Get.context!).onboarding('onBoardingRegister');

  static String loginTitle =
      AppLocalizations.of(Get.context!).login('loginTitle');
  static String loginSubTitle =
      AppLocalizations.of(Get.context!).login('loginSubTitle');

  static String email = AppLocalizations.of(Get.context!).login('email');
  static String password = AppLocalizations.of(Get.context!).login('password');
  static String forgetPassword =
      AppLocalizations.of(Get.context!).login('forgetPassword');
  static String signIn = AppLocalizations.of(Get.context!).login('signIn');
  static String createAccount =
      AppLocalizations.of(Get.context!).login('createAccount');

  // create account

  static String createAccountTitle = AppLocalizations.of(Get.context!).createAccount('createAccountTitle');
  static String createAccountSubTitle = AppLocalizations.of(Get.context!).createAccount('createAccountSubTitle');
  static String createAccountEmail = AppLocalizations.of(Get.context!).createAccount('email');
  static String createAccountPassword = AppLocalizations.of(Get.context!).createAccount('password');
  static String createAccountConfirmPassword = AppLocalizations.of(Get.context!).createAccount('confirmPassword');
  static String singUp = AppLocalizations.of(Get.context!).createAccount('signUp');
  static String alreadyAcount = AppLocalizations.of(Get.context!).createAccount('alreadyAcount');
}
