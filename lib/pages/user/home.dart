// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.white, // Ganti warna sesuai keinginan
      child: const Center(
        child: Text(
          'Konten Home',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
