import 'package:flutter/material.dart';

Future<bool?> showConfirmationDialog(
    BuildContext context, String message) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Konfirmasi Hapus',
          style: TextStyle(
            fontFamily: 'SF-Pro',
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
            fontSize: 24,
            color: Color.fromRGBO(8, 4, 22, 1),
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'SF-Pro',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color.fromRGBO(88, 107, 132, 1),
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromRGBO(8, 4, 22, 1),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
            ),
            child: const Text(
              'Batal',
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromRGBO(8, 4, 22, 1),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(72, 22, 236, 1),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text(
              'Ya, hapus',
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}

void showSuccessNotification(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Berhasil disimpan"),
    duration: Duration(seconds: 2),
  ));
}
