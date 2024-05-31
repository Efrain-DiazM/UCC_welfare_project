import 'package:get/get.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    Get.offAll(() => const LoginScreen());
  }
}