import 'package:flutter/material.dart';

class HistoryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.blueGrey,
      child: const Center(
        child: Text(
          'Konten History',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
