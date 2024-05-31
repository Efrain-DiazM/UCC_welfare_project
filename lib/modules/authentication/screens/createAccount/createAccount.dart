import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/createAccount/widgets/createAccounr_header.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/createAccount/widgets/createAccount_form.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';

class createAccount extends StatelessWidget {
  const createAccount({super.key});
  
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
                CreateAccountHeader(),

                /// Form
                CreateAccountForm(),
              ],
            ),
        ),
      ),
    );
  }
}