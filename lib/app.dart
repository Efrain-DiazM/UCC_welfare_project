
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/generated/app_localizations.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_ucc_welfare_project/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en', ''),
    );
  }
}