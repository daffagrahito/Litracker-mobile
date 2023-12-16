import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PopularBookCard extends StatefulWidget {
  final int index;

  const PopularBookCard({Key? key, required this.index}) : super(key: key);

  @override
  State<PopularBookCard> createState() => _PopularBookCardState();
}

class _PopularBookCardState extends State<PopularBookCard> {
  Future<Map<String, dynamic>> fetchPopularBook() async {
    var url = Uri.parse('http://localhost:8080/upvote_book/get_top_books/');
    var responsePopularBook = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(utf8.decode(responsePopularBook.bodyBytes));

    if (data['top_books'].isNotEmpty) {
      return {
        'book_id': data['top_books'][widget.index]['book_id'],
        'title': data['top_books'][widget.index]['title'],
        'author': data['top_books'][widget.index]['author'],
        'total_upvotes': data['top_books'][widget.index]['total_upvotes'],
        'image_url_l': data['top_books'][widget.index]['image_url_l'],
        'image_url_m': data['top_books'][widget.index]['image_url_m'],
        'image_url_s': data['top_books'][widget.index]['image_url_s'],
        'latest_upvote_time': data['top_books'][widget.index]
            ['latest_upvote_time'],
        'index': widget.index + 1,
      };
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchPopularBook(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Map<String, dynamic> book = snapshot.data ?? {};

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Buku Terpopuler",
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kashmirBlue400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (book.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                    ),
                    child: _buildBookCard(book),
                  ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildBookCard(Map<String, dynamic> book) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: jaguar500,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/home/king.png"),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        book['index'].toString(),
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 184,
                  padding: EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        book['title'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SF-Pro',
                          fontWeight: FontWeight.w600,
                          color: jaguar950,
                        ),
                      ),
                      Text(
                        book['author'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SF-Pro',
                          fontWeight: FontWeight.w400,
                          color: kashmirBlue400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(12)),
                  child: Image.network(
                    book['image_url_l'].replaceFirst(
                        "http://images.amazon.com/",
                        "https://m.media-amazon.com/"),
                    width: 72,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                          "assets/home/dummy-book.png"); // Replace with your default image
                    },
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kashmirBlue50,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/home/upvote.png",
                width: 48,
                height: 48,
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book['total_upvotes'].toString() + ' upvote buku ini',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.8,
                        color: jaguar950,
                      ),
                    ),
                    Text(
                      book['latest_upvote_time'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: jaguar400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
