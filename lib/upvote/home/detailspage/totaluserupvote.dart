// Paling atas untuk upvote
import 'package:flutter/material.dart';

Widget totalUpvoteStyle(totalUpvotedBookbyUser) {
  return Container(
    width: 200,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(12),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(28)),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/home/upvote.png",
          width: 36,
          height: 36,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "$totalUpvotedBookbyUser upvote buku ini",
          style: const TextStyle(
              fontFamily: 'SF-Pro',
              letterSpacing: -0.7,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
