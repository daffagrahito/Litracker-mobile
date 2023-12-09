// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:litracker_mobile/pages/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => OnBoarding()),
        (route) => false,
      );
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 33, 255, 1),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              'assets/images/splash-bg.png',
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0), // Set left padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/splash-icon.png',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Litracker",
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
