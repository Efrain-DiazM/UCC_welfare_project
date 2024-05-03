import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'My app';

  @override
  String get content => 'Hello';

  @override
  String onboarding(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'onBoardingTitle1': 'Discover your best university version!',
        'onBoardingSubTitle1': 'Welcome to UCC well-being, where well-being and academic success go hand in hand',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String login(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'loginTitle': 'Welcome back,',
        'loginSubTitle': 'Discover Limitless Choices and Unmatched Convenience.',
        'email': 'E-Mail',
        'password': 'Password',
        'rememberMe': 'Remember Me',
        'forgetPassword': 'Forget Password?',
        'signIn': 'Sign In',
        'createAccount': 'Create Account',
        'orSignInWith': 'Or Sign in With',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
