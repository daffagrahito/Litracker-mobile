// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';

import 'package:litracker_mobile/pages/user/utils/color_choice.dart';

class UpVoteList extends StatefulWidget {
  const UpVoteList({Key? key}) : super(key: key);

  @override
  _UpVoteListState createState() => _UpVoteListState();
}

class _UpVoteListState extends State<UpVoteList> {
  bool isLoading = false;

  void showSuccessNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: jaguar400,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.white, // Anda dapat menyesuaikan warnanya
                ),
              ),
              const SizedBox(width: 8.0), // Jarak antara ikon dan teks
              const Text(
                'Berhasil membatalkan upvote!',
                style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: jaguar600, // Anda dapat menyesuaikan warnanya
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.85,
            left: 40,
            right: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 249, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Image.asset(
                        "assets/upvote/left-arrow.png",
                        width: 36,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Buku Terupvote",
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      letterSpacing: -0.7,
                      color: Color.fromRGBO(
                        8,
                        4,
                        22,
                        1,
                      ),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/upvote/dummy-book.png",
                          width: 52,
                          height: 64,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 220,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nature Kingdom",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color.fromRGBO(8, 4, 22, 1),
                                  letterSpacing: -0.7,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Clove Griffith",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(132, 151, 172, 1),
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(246, 247, 249, 1),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset("assets/upvote/upvote-36.png"),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  "1604",
                                  style: TextStyle(
                                    fontFamily: 'SF-Pro',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Color.fromRGBO(8, 4, 22, 1),
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Yakin ingin membatalkan upvote?',
                                    style: TextStyle(
                                      fontFamily: 'SF-Pro',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                      fontSize: 24,
                                      color: Color.fromRGBO(8, 4, 22, 1),
                                    ),
                                  ),
                                  content: const Text(
                                    'Tekan OK untuk melanjutkan',
                                    style: TextStyle(
                                      fontFamily: 'SF-Pro',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color.fromRGBO(88, 107, 132, 1),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  buttonPadding: const EdgeInsets.all(16),
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 40,
                                    left: 24,
                                    top: 12,
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color.fromRGBO(8, 4, 22, 1),
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 20,
                                        ),
                                      ),
                                      child: const Text(
                                        'Kembali',
                                        style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color.fromRGBO(8, 4, 22, 1),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: const Color.fromRGBO(
                                            72, 22, 236, 1),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 20,
                                        ),
                                      ),
                                      child: isLoading
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Text('OK'),
                                      onPressed: () async {
                                        Navigator.pop(context);

                                        setState(() {
                                          isLoading = true;
                                        });

                                        // Simulate loading
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                        );

                                        setState(() {
                                          isLoading = false;
                                        });

                                        // Show success notification
                                        showSuccessNotification();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isLoading
                                    ? Colors.grey
                                    : const Color.fromRGBO(81, 33, 255, 1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 36,
                              width: 88,
                              alignment: Alignment.center,
                              child: isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Batalkan",
                                      style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
