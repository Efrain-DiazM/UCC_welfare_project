
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/generated/app_localizations.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/controllers/change_language.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/screens/createAccount/createAccount.dart';
// import 'package:flutter_ucc_welfare_project/modules/authentication/screens/login/login.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/screens/onboarding/onboarding.dart';
// import 'package:flutter_ucc_welfare_project/modules/home/controllers/change_language.dart';
import 'package:flutter_ucc_welfare_project/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './generated/app_localizations.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final ChangeLanguageController changeLanguageController = Get.put(ChangeLanguageController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingScreen(),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      
      localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'), // Spanish
          Locale('en'), // English
        ],

      // locale: const Locale('es', ''),

      locale: Locale(changeLanguageController.locale.value)
    );
  }
}