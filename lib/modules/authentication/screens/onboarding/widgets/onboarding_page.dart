import 'package:flutter/material.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/controllers/onboarding/onboarding_controller.dart';

import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:flutter_ucc_welfare_project/utils/helpers/helper_functions.dart';
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
    return Padding(
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

          const Spacer(), // Añadido para empujar los botones hacia la parte inferior
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para iniciar sesión
                  }, 
                  child: Text(AppText.onBoardingLogin),
                ),
              ),
              const SizedBox(width: 8), // Espacio entre botones
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Lógica para el registro
                  }, 
                  child: Text(AppText.onBoardingRegister),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
