// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litracker_mobile/pages/adminLoginPage.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: screenWidth,
          height: screenHeight,
          padding: const EdgeInsets.only(
            top: 60,
            right: 40,
            left: 40,
            bottom: 20,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    "assets/images/left-arrow-login.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    text: "Daftar",
                    style: TextStyle(
                      color: Color.fromRGBO(8, 4, 22, 1),
                      fontFamily: 'SF-Pro',
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    text: "Daftar sekarang dan nikmati layanan Litracker!",
                    style: TextStyle(
                      color: Color.fromRGBO(8, 4, 22, 1),
                      fontFamily: 'SF-Pro',
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 20 / 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(8, 4, 22, 1),
                  ),
                  hintText: 'Masukkan username',
                  hintStyle: const TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(132, 151, 172, 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(
                            234, 237, 255, 1)), // Warna saat normal
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(
                            145, 149, 255, 1)), // Warna saat dalam fokus
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  prefixIcon: Image.asset(
                    'assets/images/email.png',
                    width: 32,
                    height: 32,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 56,
                    minHeight: 56,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(8, 4, 22, 1),
                  ),
                  hintText: 'Masukkan password',
                  hintStyle: const TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(132, 151, 172, 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(
                            234, 237, 255, 1)), // Warna saat normal
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(
                            145, 149, 255, 1)), // Warna saat dalam fokus
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  prefixIcon: Image.asset(
                    'assets/images/password.png',
                    width: 32,
                    height: 32,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 56,
                    minHeight: 56,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  // Aksi yang dijalankan saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  backgroundColor: const Color.fromRGBO(8, 4, 22, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      0), // Set minimumSize ke lebar layar
                ),
                child: const Text(
                  'Daftar Sekarang',
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Sudah punya akun?  ",
                    style: const TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(8, 4, 22, 1),
                    ),
                    children: [
                      TextSpan(
                        text: "Masuk",
                        style: const TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(72, 22, 236, 1),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Anda administrator?  ",
                    style: const TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(8, 4, 22, 1),
                    ),
                    children: [
                      TextSpan(
                        text: "Login di sini",
                        style: const TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(72, 22, 236, 1),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const AdminLoginPage()),
                            );
                          },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
