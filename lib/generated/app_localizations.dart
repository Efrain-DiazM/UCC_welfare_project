import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Aplicación'**
  String get appTitle;

  /// No description provided for @content.
  ///
  /// In es, this message translates to:
  /// **'Hola'**
  String get content;

  /// No description provided for @onboarding.
  ///
  /// In es, this message translates to:
  /// **'{name, select, onBoardingTitle1{¡Descubre tu mejor versión universitaria!} onBoardingSubTitle1{Bienvenido a bienestar UCC, donde el bienestar y el éxito académico van de la mano} onBoardingLogin{Acceder} onBoardingRegister{Registrarse} other{}}'**
  String onboarding(String name);

  /// No description provided for @login.
  ///
  /// In es, this message translates to:
  /// **'{name, select, loginTitle{Inicia sesión aquí} loginSubTitle{Bienvenido de nuevo, te han echado de menos!} email{Correo electrónico} password{Contraseña} rememberMe{Recuérdame} forgetPassword{Olvidaste tu contraseña?} signIn{Iniciar sesión} createAccount{Crear nueva cuenta} orSignInWith{O inicie sesión con} loginIncorrect{Usuario / contraseña incorrecta} other{}}'**
  String login(String name);

  /// No description provided for @createAccount.
  ///
  /// In es, this message translates to:
  /// **'{name, select, createAccountTitle{Crear Cuenta} createAccountSubTitle{Crea una cuenta para que puedas registrar tu participacion en actividades} nameAccount{Nombre de usuario} email{Correo electrónico} password{Contraseña} confirmPassword{Confirmar Contraseña} signUp{Registrarse} alreadyAcount{Ya tengo una cuenta} orSignInWith{O inicie sesión con} other{}}'**
  String createAccount(String name);

  /// No description provided for @navigation.
  ///
  /// In es, this message translates to:
  /// **'{name, select, home{Inicio} event{Eventos} notification{Registro} other{}}'**
  String navigation(String name);

  /// No description provided for @home.
  ///
  /// In es, this message translates to:
  /// **'{name, select, carousel{Actualidad, noticicias de la UCC} news{Noticias recientes} close{Cerrar} other{}}'**
  String home(String name);

  /// No description provided for @codeQR.
  ///
  /// In es, this message translates to:
  /// **'{name, select, scan{Escanear codigo QR} other{}}'**
  String codeQR(String name);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
