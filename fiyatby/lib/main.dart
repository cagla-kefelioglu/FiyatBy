import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import 'View/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock
          .navigationKey, //sayfalar arası geçişte Grock kütüphanesi ile geçişi sağlar.
      scaffoldMessengerKey: Grock
          .scaffoldMessengerKey, // feedbacklerde Grock kütüphanesini kullanmamızı sağlar.
      theme: ThemeData(),
      // ignore: prefer_const_constructors
      home: Splash(),
    );
  }
}
