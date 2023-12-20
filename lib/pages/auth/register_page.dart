import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litracker_mobile/pages/auth/admin_login_page.dart';
import 'package:litracker_mobile/pages/auth/login_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegistPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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

                      if (username.isEmpty || password.isEmpty) {
                        // Tampilkan pesan error jika kolom tidak diisi
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    child: const Icon(
                                      Icons.warning,
                                      color: Colors
                                          .white, // Anda dapat menyesuaikan warnanya
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 8.0), // Jarak antara ikon dan teks
                                  const Text(
                                    'Lengkapi data Anda!',
                                    style: TextStyle(
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
                        return;
                      }

                      setState(() {
                        _isLoading = true;
                      });

                      final response = await request
                          .post("https://litracker-a01-tk.pbp.cs.ui.ac.id/register-mobile/", {
                        'username': username,
                        'password': password,
                      });

                      setState(() {
                        _isLoading = false;
                      });

                      if (response['status']) {
                        String message = response['message'];

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
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
                                        width:
                                            8.0), // Jarak antara ikon dan teks
                                    Text(
                                      '${message}',
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
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Register sebagai user gagal!',
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                                fontSize: 24,
                                color: Color.fromRGBO(8, 4, 22, 1),
                              ),
                            ),
                            content: Text(
                              response['message'],
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
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      backgroundColor: const Color.fromRGBO(8, 4, 22, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.width,
                          0), // Set minimumSize ke lebar layar
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
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
                                    builder: (context) =>
                                        const AdminLoginPage(),
                                  ),
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
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
