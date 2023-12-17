import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<void> fetchUserData(context, totalUpvotedBooks) async {
  final request = context.watch<CookieRequest>();
  final responseVotes =
      await request.get('http://localhost:8080/upvote_book/get_upvoted_books/');

  int total_votes = responseVotes['total_upvoted_books'];

  totalUpvotedBooks = total_votes;
}
