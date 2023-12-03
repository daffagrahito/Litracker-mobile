// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomNavData {
  static const List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Beranda',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.reviews),
      label: 'Ulas',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Riwayat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];
}
