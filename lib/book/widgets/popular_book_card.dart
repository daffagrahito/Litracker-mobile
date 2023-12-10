import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/models/book.dart';

class PopularBookCard extends StatelessWidget {
  final Book book;
  final int rank;
  final int totalUpvotes;

  const PopularBookCard({
    Key? key,
    required this.book,
    required this.rank,
    required this.totalUpvotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(rank.toString()),
              ),
              title: Text(book.fields.title),
              subtitle: Text('Buku dibaca'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('${totalUpvotes.toString()} Total upvote'),
                SizedBox(width: 8),
                Icon(Icons.arrow_upward_sharp, color: Colors.blue),
                SizedBox(width: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
