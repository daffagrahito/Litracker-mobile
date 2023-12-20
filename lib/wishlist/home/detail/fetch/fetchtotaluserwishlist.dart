import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

Future<int> fetchTotalUsersWishlist(context, bookID) async {
  final requestTotalUsers = Provider.of<CookieRequest>(context, listen: false);
  final responseUsersWishlist = await requestTotalUsers.get(
      'http://localhost:8080/wishlist_book/get_wishlisting_users/${bookID}');

  return responseUsersWishlist['total_users_wishlist'];
}
