// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'View/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});



  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock
          .navigationKey, //sayfalar arası geçişte Grock kütüphanesi ile geçişi sağlar.
      scaffoldMessengerKey: Grock
          .scaffoldMessengerKey, // feedbacklerde Grock kütüphanesini kullanmamızı sağlar.
      theme: ThemeData(),
      home: Splash()
    );
  }
}

