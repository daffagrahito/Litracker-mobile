import 'package:flutter/material.dart';
import 'package:litracker_mobile/wishlist/home/detail/fetch/fetchiswishlist.dart';

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
