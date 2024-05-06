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
        'onBoardingLogin': 'Login',
        'onBoardingRegister': 'Register',
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
        'loginTitle': 'Login here',
        'loginSubTitle': 'Welcome back you’ve been missed!',
        'email': 'E-Mail',
        'password': 'Password',
        'rememberMe': 'Remember Me',
        'forgetPassword': 'Forgot your password?',
        'signIn': 'Sign In',
        'createAccount': 'Create new account',
        'orSignInWith': 'Or Sign in With',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String createAccount(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'createAccountTitle': 'Create Account',
        'createAccountSubTitle': 'Create an account so you can register your participation in activities',
        'email': 'E-Mail',
        'password': 'Password',
        'confirmPassword': 'Confirm Password',
        'signUp': 'Sign Up',
        'alreadyAcount': 'Already have an account',
        'orSignInWith': 'Or Sign in With',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
