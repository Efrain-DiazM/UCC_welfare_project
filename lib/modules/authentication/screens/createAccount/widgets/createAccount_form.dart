import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

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
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            TextFormField(
              decoration: InputDecoration(
                // prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppText.createAccountConfirmPassword,
                suffixIcon: const Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(AppText.singUp),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            TextButton(
              onPressed: () {},
              child: Text(AppText.alreadyAcount),
            ),
          ],
        ),
      )
    );
  }
}