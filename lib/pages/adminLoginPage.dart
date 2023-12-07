// ignore_for_file: file_names, unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litracker_mobile/pages/admin/home.dart';
import 'package:litracker_mobile/pages/registPage.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
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
                    text: "Login Administrator",
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
                    text:
                        "Jika Anda bukan admin, Anda bisa kembali ke laman sebelumnya",
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
                style: const TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(8, 4, 22, 1),
                ),
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
                style: const TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(8, 4, 22, 1),
                ),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AdminHome()),
                  );
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
                  'Masuk Akun',
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
            ],
          ),
        ),
      ),
    );
  }
}
