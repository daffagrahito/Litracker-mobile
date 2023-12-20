// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:litracker_mobile/pages/auth/admin_login_page.dart';
import 'package:litracker_mobile/pages/auth/register_page.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:litracker_mobile/data/models/user.dart';
import 'package:litracker_mobile/pages/user/navigate.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool showError =
      false; // Add this variable to track whether to show the error

  void showSuccessNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: jaguar400,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.white, // Anda dapat menyesuaikan warnanya
                ),
              ),
              const SizedBox(width: 8.0), // Jarak antara ikon dan teks
              Text(
                message,
                style: const TextStyle(
                  fontFamily: 'SF-Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: jaguar600, // Anda dapat menyesuaikan warnanya
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.85,
            left: 40,
            right: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

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
                  child: Image.asset(
                    "assets/images/left-arrow-login.png",
                    width: 28,
                    height: 28,
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
                    text: "Masuk Akun",
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
                        "Untuk menikmati layanan, silakan masuk dengan akun Anda terlebih dahulu!",
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
                controller: _usernameController,
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
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.red), // Warna saat terjadi error
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
                controller: _passwordController,
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
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.red), // Warna saat terjadi error
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
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  try {
                    setState(() {
                      isLoading = true;
                    });

                    final response = await request
                        .login("https://litracker-a01-tk.pbp.cs.ui.ac.id/mobile-login/", {
                      'username': username,
                      'password': password,
                    });

                    if (request.loggedIn) {
                      //String message = response['message'];
                      String uname = response['username'];
                      int id = response['id'];
                      loggedInUser = User(username: uname, id: id);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigateUser()),
                      );

                      // Hide the loading indicator
                      setState(() {
                        isLoading = false;
                      });

                      // Show modal
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Login Berhasil',
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                              fontSize: 24,
                              color: Color.fromRGBO(8, 4, 22, 1),
                            ),
                          ),
                          content: Text(
                            'Selamat datang kembali, $uname!',
                            style: const TextStyle(
                              fontFamily: 'SF-Pro',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color.fromRGBO(88, 107, 132, 1),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          buttonPadding: const EdgeInsets.all(16),
                          contentPadding: const EdgeInsets.only(
                            bottom: 40,
                            left: 24,
                            top: 12,
                          ),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(72, 22, 236, 1),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 20,
                                ),
                              ),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      String message = response != null
                          ? response['message']
                          : 'Login failed';

                      // Hide the loading indicator
                      setState(() {
                        isLoading = false;
                      });

                      // Show error and trigger the error border
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Container(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                        color: jaguar400,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    child: const Icon(
                                      Icons.error,
                                      color: Colors
                                          .white, // Anda dapat menyesuaikan warnanya
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 8.0), // Jarak antara ikon dan teks
                                  Text(
                                    message,
                                    style: const TextStyle(
                                      fontFamily: 'SF-Pro',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor:
                                jaguar600, // Anda dapat menyesuaikan warnanya
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.85,
                                left: 40,
                                right: 40),
                          ),
                        );
                      setState(() {
                        showError = true;
                      });
                    }
                  } catch (e) {
                    // Hide the loading indicator
                    setState(() {
                      isLoading = false;
                    });

                    // Show error and trigger the error border
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Container(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                      color: jaguar400,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: const Icon(
                                    Icons.check_circle,
                                    color: Colors
                                        .white, // Anda dapat menyesuaikan warnanya
                                  ),
                                ),
                                const SizedBox(
                                    width: 8.0), // Jarak antara ikon dan teks
                                Text(
                                  'Error, nih! $e',
                                  style: const TextStyle(
                                    fontFamily: 'SF-Pro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                          backgroundColor:
                              jaguar600, // Anda dapat menyesuaikan warnanya
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.85,
                              left: 40,
                              right: 40),
                        ),
                      );
                    setState(() {
                      showError = true;
                    });
                  }
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
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Masuk Akun',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Belum punya akun?  ",
                    style: const TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(8, 4, 22, 1),
                    ),
                    children: [
                      TextSpan(
                        text: "Daftar",
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
                                  builder: (context) => const RegistPage()),
                            );
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
