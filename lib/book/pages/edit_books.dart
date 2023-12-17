// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/models/book.dart';
import 'package:litracker_mobile/book/utils/books_utils.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:litracker_mobile/reading_history/utils/reading_history_utils.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class EditBooksPage extends StatefulWidget {
  const EditBooksPage({super.key});

  @override
  State<EditBooksPage> createState() => _EditBooksState();
}

class _EditBooksState extends State<EditBooksPage> {
  late Future<List<Book>> futureBooks;
  TextEditingController searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late PageController _controller;
  //int _currentIndex = 0;
  List<Book>? filteredBooks;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8,
      initialPage: 0,
    );
    futureBooks = fetchBooks();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: kashmirBlue50,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: jaguar500,
                ),
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: searchController.text.isEmpty,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/home/back-to-home.png",
                              width: 44,
                              height: 44,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: searchController.text.isEmpty,
                          child: SizedBox(
                            width: 16,
                          ),
                        ),
                        Container(
                            height: 44,
                            width: MediaQuery.of(context).size.width - 140,
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(color: jaguar400, borderRadius: BorderRadius.all(Radius.circular(16))),
                            child: Row(
                              children: [
                                Image.asset("assets/home/search-icon.png"),
                                SizedBox(
                                  width: 12,
                                ),
                                Flexible(
                                  child: TextField(
                                    controller: searchController,
                                    onChanged: (value) {
                                      setState(() {
                                        futureBooks.then((books) {
                                          filteredBooks = filterBooks(books, value);
                                        });
                                      });
                                    },
                                    style: TextStyle(
                                      fontFamily: "SF-Pro",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Cari Buku",
                                      hintStyle: TextStyle(
                                        fontFamily: "SF-Pro",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Visibility(
                          visible: searchController.text.isNotEmpty,
                          child: SizedBox(
                            width: 16,
                          ),
                        ),
                        Visibility(
                          visible: searchController.text.isNotEmpty,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                searchController.clear(); // Clear the search text
                              });
                            },
                            child: Image.asset(
                              "assets/home/close-search.png",
                              width: 44,
                              height: 44,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: FutureBuilder<List<Book>>(
                  future: futureBooks,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Show loading spinner while waiting for data
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Show error message if there is an error
                    } else {
                      // Determine the number of books to show
                      List<Book> filteredBooks = filterBooks(snapshot.data!, searchController.text);

                      int numBooksToShow = filteredBooks.length;

                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Visibility(
                                    child: searchController.text.isEmpty
                                        ? Text("Edit Buku",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(fontFamily: 'SF-Pro', fontSize: 14, fontWeight: FontWeight.w500, color: kashmirBlue400))
                                        : Text("Hasil Pencarian: ${filteredBooks.length} buku",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(fontFamily: 'SF-Pro', fontSize: 14, fontWeight: FontWeight.w500, color: kashmirBlue400)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            ...filteredBooks.getRange(0, numBooksToShow).map(
                                  (book) => Container(
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.network(
                                              book.fields.imageUrlL.replaceFirst("http://images.amazon.com/", "https://m.media-amazon.com/"),
                                              width: 50,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                            width: MediaQuery.of(context).size.width - 272,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  book.fields.title,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(fontFamily: 'SF-Pro', fontSize: 16, fontWeight: FontWeight.w600, color: jaguar950),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  book.fields.author,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: kashmirBlue400,
                                                    fontFamily: 'SF-Pro',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            )),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                TextEditingController isbnController = TextEditingController(text: book.fields.isbn);
                                                TextEditingController titleController = TextEditingController(text: book.fields.title);
                                                TextEditingController authorController = TextEditingController(text: book.fields.author);
                                                TextEditingController publishedYearController =
                                                    TextEditingController(text: book.fields.publishedYear.toString());
                                                TextEditingController publisherController = TextEditingController(text: book.fields.publisher);
                                                TextEditingController imageUrlLController = TextEditingController(text: book.fields.imageUrlL);

                                                await showDialog<bool>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Edit Buku',
                                                        style: TextStyle(
                                                          fontFamily: 'SF-Pro',
                                                          fontWeight: FontWeight.w700,
                                                          letterSpacing: -1,
                                                          fontSize: 24,
                                                          color: Color.fromRGBO(8, 4, 22, 1),
                                                        ),
                                                      ),
                                                      content: Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: <Widget>[
                                                            buildTextField(isbnController, 'ISBN'),
                                                            buildTextField(titleController, 'Title'),
                                                            buildTextField(authorController, 'Author'),
                                                            buildTextField(publishedYearController, 'Published Year', isInteger: true),
                                                            buildTextField(publisherController, 'Publisher'),
                                                            buildTextField(imageUrlLController, 'URL Cover Buku'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          style: TextButton.styleFrom(
                                                            foregroundColor: const Color.fromRGBO(8, 4, 22, 1),
                                                            backgroundColor: Colors.white,
                                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                                          ),
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                              fontFamily: 'SF-Pro',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 14,
                                                              color: Color.fromRGBO(8, 4, 22, 1),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(context).pop(false);
                                                          },
                                                        ),
                                                        TextButton(
                                                          style: TextButton.styleFrom(
                                                            backgroundColor: const Color.fromRGBO(72, 22, 236, 1),
                                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                                          ),
                                                          onPressed: () async {
                                                            if (_formKey.currentState!.validate()) {
                                                              final String isbn = isbnController.text;
                                                              final String title = titleController.text;
                                                              final String author = authorController.text;
                                                              final String publishedYear = publishedYearController.text;
                                                              final String publisher = publisherController.text;
                                                              final String imageUrlL = imageUrlLController.text;

                                                              final response = await request.postJson(
                                                                "http://localhost:8080/home/api/book/edit/${book.pk}/",
                                                                jsonEncode(
                                                                  <String, dynamic>{
                                                                    'isbn': isbn,
                                                                    'title': title,
                                                                    'author': author,
                                                                    'published_year': publishedYear,
                                                                    'publisher': publisher,
                                                                    'image_url_l': imageUrlL,
                                                                  },
                                                                ),
                                                              );

                                                              String dialogText;
                                                              if (response['status'] == 'success') {
                                                                dialogText = "Buku berhasil diubah!";
                                                              } else {
                                                                dialogText = "Terdapat kesalahan, silahkan coba lagi.";
                                                              }

                                                              setState(
                                                                () {
                                                                  futureBooks = fetchBooks(); // Re-fetch the books
                                                                },
                                                              );

                                                              // Close the first dialog
                                                              Navigator.of(context).pop(true);

                                                              // Show the second dialog
                                                              showDialogWithText(context, dialogText);
                                                            }
                                                          },
                                                          child: const Text(
                                                            'Save',
                                                            style: TextStyle(
                                                              fontFamily: 'SF-Pro',
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 14,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Image.asset(
                                                "assets/history/settings.png",
                                                width: 32,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                bool? result = await showConfirmationDialog(
                                                  context,
                                                  "Apakah Anda yakin ingin menghapus buku ini?",
                                                );
                                                if (result != null && result) {
                                                  // Perform delete operation
                                                  try {
                                                    await deleteBook(book.pk);
                                                    showDialogWithText(context, 'Buku berhasil dihapus.');

                                                    // Refresh the widget
                                                    setState(() {
                                                      futureBooks = fetchBooks(); // Re-fetch the books
                                                    });
                                                  } catch (e) {
                                                    showDialogWithText(context, 'Gagal menghapus buku.');
                                                  }
                                                }
                                              },
                                              child: Image.asset(
                                                "assets/history/delete.png",
                                                width: 32,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
