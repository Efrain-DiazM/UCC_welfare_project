import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/app.dart';
import 'package:flutter_ucc_welfare_project/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
  // runApp(const MyApp());
}