import 'package:flutter/material.dart';
import 'package:litracker_mobile/trash/upvote/home/detailspage/fetch/fetchisupvote.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

toggleUpvote(context, bookID, isVoted) {
  return Container(
    child: FutureBuilder<bool>(
      future: fetchHasUserUpvoted(context, bookID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Image.asset(
            isVoted
                ? "assets/home/upvote_fill.png"
                : "assets/home/upvote_blank.png",
            width: 36,
            height: 36,
          );
        }
      },
    ),
  );
}
