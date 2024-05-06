import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm ({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                // prefixIcon: const Icon(Iconsax.direct_right),
                labelText: AppText.email,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            TextFormField(
              decoration: InputDecoration(
                // prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppText.password,
                suffixIcon: const Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(AppText.forgetPassword),
                ),
              ]
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AppText.signIn),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            TextButton(
              onPressed: () {},
              child: Text(AppText.createAccount),
            ),
          ],
        ),
      )
    );
  }
}