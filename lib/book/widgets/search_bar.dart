import 'package:flutter/material.dart';

// Contoh Warna
const Color searchBarColor = Color(0xFFE6EFF2);
const Color textColor = Colors.black;

// CustomSearchBar Widget
class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the size of the screen (or parent widget)
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        // Custom background shape
        Container(
          height: 140, // Adjust the height to fit your design
          width: screenSize.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(72, 22, 236, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        // Positioned TextField
        Positioned(
          top: 60, // Adjust the position to match your design
          child: Container(
            width: screenSize.width * 0.8, // Width is 80% of the screen width
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Cari Buku",
                prefixIcon: const Icon(Icons.search, color: textColor),
                fillColor: searchBarColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
