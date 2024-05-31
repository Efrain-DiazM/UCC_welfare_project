import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/app.dart';
import 'package:flutter_ucc_welfare_project/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/controllers/logout.dart';
import 'package:get/get.dart';

void main() async{
  Get.put(AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
  // runApp(const MyApp());
}