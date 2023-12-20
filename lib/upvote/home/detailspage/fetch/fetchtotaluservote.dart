// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

Future<int> fetchTotalUsersVote(context, bookID) async {
  final requestTotalUsers = Provider.of<CookieRequest>(context, listen: false);
  final responseUsersVote = await requestTotalUsers
      .get('http://localhost:8080/upvote_book/get_upvoting_users/${bookID}');

  return responseUsersVote['total_users_upvote'];
}
