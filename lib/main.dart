import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Litracker',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
