import 'package:flutter/material.dart';
import 'package:litracker_mobile/wishlist/home/fetch/fetchiswishlist.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

toggleWishlist(context, bookID, isWishlisted) {
  return Container(
    child: FutureBuilder<bool>(
      future: fetchHasUserWishlisted(context, bookID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Image.asset(
            isWishlisted
                ? "assets/home/wishlist_fill.png"
                : "assets/home/wishlist_blank.png",
            width: 36,
            height: 36,
          );
        }
      },
    ),
  );
}
