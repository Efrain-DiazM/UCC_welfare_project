import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SvgPicture.asset(
        //   AppImage.onBoardingImage1,
        //   height: 150,
        // ),
        const SizedBox(height: AppSizes.spaceBtwSections),

        Text(
          AppText.createAccountTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSizes.spaceBtwInputFields),

        Text(
          AppText.createAccountSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}