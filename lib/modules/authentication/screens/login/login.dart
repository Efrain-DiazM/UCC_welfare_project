import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.appBarHeight,
            left: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,),
          child: Column(
            children: [
              /// Logo, Title and Subtitle
              LoginHeader(),

              /// Form
              LoginForm(),

              /// Divider
              // FormDivider(dividerText: AppText.orSignInWith.capitalize!),
              // const SizedBox(height: AppSizes.spaceBtwSections),

              /// Footer
              // const SocialButtons(),
            ],
          ),
        ),
      )
    );
  }
}