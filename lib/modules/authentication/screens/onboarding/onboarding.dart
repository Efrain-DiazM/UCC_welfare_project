import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

// import 'package:app_mobile/modules/authentication/controllers/onboarding/onboarding_controller.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/screens/onboarding/widgets/onboarding_elevated_button.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/onboarding/widgets/onboarding_page.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/image_strings.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: AppImage.onBoardingImage1,
                title: AppText.onBoardingTitle1,
                subTitle: AppText.onBoardingSubTitle1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
