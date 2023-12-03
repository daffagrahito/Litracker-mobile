// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class ReviewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.orange, // Ganti warna sesuai keinginan
      child: const Center(
        child: const Text(
          'Konten Review',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
