import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mi Aplicación';

  @override
  String get content => 'Hola';

  @override
  String onboarding(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'onBoardingTitle1': '¡Descubre tu mejor versión universitaria!',
        'onBoardingSubTitle1': 'Bienvenido a bienestar UCC, donde el bienestar y el éxito académico van de la mano',
        'onBoardingLogin': 'Acceder',
        'onBoardingRegister': 'Registrarse',
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
        'loginTitle': 'Inicia sesión aquí',
        'loginSubTitle': 'Bienvenido de nuevo, te han echado de menos!',
        'email': 'Correo electrónico',
        'password': 'Contraseña',
        'rememberMe': 'Recuérdame',
        'forgetPassword': 'Olvidaste tu contraseña?',
        'signIn': 'Iniciar sesión',
        'createAccount': 'Crear nueva cuenta',
        'orSignInWith': 'O inicie sesión con',
        'loginIncorrect': 'Usuario / contraseña incorrecta',
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
        'createAccountTitle': 'Crear Cuenta',
        'createAccountSubTitle': 'Crea una cuenta para que puedas registrar tu participacion en actividades',
        'nameAccount': 'Nombre de usuario',
        'email': 'Correo electrónico',
        'password': 'Contraseña',
        'confirmPassword': 'Confirmar Contraseña',
        'signUp': 'Registrarse',
        'alreadyAcount': 'Ya tengo una cuenta',
        'orSignInWith': 'O inicie sesión con',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String navigation(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'home': 'Inicio',
        'event': 'Eventos',
        'notification': 'Registro',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String home(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'carousel': 'Actualidad, noticicias de la UCC',
        'news': 'Noticias recientes',
        'close': 'Cerrar',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String codeQR(String name) {
    String _temp0 = intl.Intl.selectLogic(
      name,
      {
        'scan': 'Escanear codigo QR',
        'other': '',
      },
    );
    return '$_temp0';
  }
}
