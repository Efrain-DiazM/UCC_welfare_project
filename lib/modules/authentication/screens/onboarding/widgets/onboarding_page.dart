import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/controllers/change_language.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/createAccount/createAccount.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/login.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/controllers/onboarding/onboarding_controller.dart';

import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:flutter_ucc_welfare_project/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    // Get.put(OnBoardingController());
    // final controller = OnBoardingController.instance;
    final ChangeLanguageController changeLanguageController = Get.put(ChangeLanguageController());
    return Scaffold(
      appBar: AppBar(
        // title: Text(AppText.onBoardingTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              changeLanguageController.changeLanguage(
                changeLanguageController.locale.value == 'es' ? 'en' : 'es',
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              width: HelperFunctions.screenWidth() * 0.8,
              height: HelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
      
            const Spacer(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const LoginScreen());
                    }, 
                    child: Text(AppText.onBoardingLogin),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(const createAccount());
                    }, 
                    child: Text(AppText.onBoardingRegister),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
