// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 249, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(81, 33, 255, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/review/back.png",
                        width: 32,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 100,   // Adjust ini kalo box mau lebih besar
                            height: 100,  // Adjust ini kalo box mau lebih besar
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(28)),
                              color: Color.fromRGBO(92, 66, 255, 1),
                            ),
                            padding: EdgeInsets.all(10),  // Benerin ini juga buat padding imagenya
                            child: Image.network(
                              book.fields.imageUrlL,
                              height: 15,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            book.fields.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Author: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: '${book.fields.author}', style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'ISBN: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: '${book.fields.isbn}', style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Published Year: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: '${book.fields.publishedYear}', style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Publisher: ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: '${book.fields.publisher}', style: TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}