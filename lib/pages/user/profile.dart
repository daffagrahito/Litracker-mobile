// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.white, // Ganti warna sesuai keinginan
      child: const Center(
        child: const Text(
          'Konten Profile',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
