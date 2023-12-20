import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/splash_screen.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: const MaterialApp(
          title: 'Litracker',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
