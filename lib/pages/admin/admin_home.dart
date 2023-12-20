// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/pages/book_form.dart';
import 'package:litracker_mobile/book/pages/edit_books.dart';
import 'package:litracker_mobile/pages/auth/login_page.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: jaguar400, // Set the background color to jaguar400
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Admin Homepage",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height:
                    40), // Add some space between the header and the buttons
            buildButton(
              context,
              "Tambah Buku",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookFormPage(),
                  ),
                );
              },
              color: Colors.white,
              textColor: Colors.black,
            ),
            const SizedBox(height: 20), // Add some space between the buttons
            buildButton(
              context,
              "Edit Buku",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditBooksPage(),
                  ),
                );
              },
              color: Colors.white,
              textColor: Colors.black,
            ),
            const SizedBox(height: 20), // Add some space between the buttons
            buildButton(
              context,
              "Logout",
              () async {
                final response = await request
                    .logout("https://litracker-a01-tk.pbp.cs.ui.ac.id/logout-mobile/");
                String message = response["message"];
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Text(
                              "$message Sampai jumpa, $uname.",
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            // Jarak antara ikon dan teks
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
                          bottom: MediaQuery.of(context).size.height * 0.85,
                          left: 40,
                          right: 40),
                    ),
                  );
                }
              },
              image: Image.asset('assets/profile/profile-logout.png'),
              color: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed, {
    Widget? image,
    Color color = Colors.blue,
    Color textColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[
              image,
            ],
            const SizedBox(width: 6),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
