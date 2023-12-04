import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'Konten Home',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
