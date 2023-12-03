// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litracker_mobile/data/onboardingData.dart';
import 'package:litracker_mobile/pages/loginPage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(81, 33, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: listKonten.length,
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 60.0,
                          left: 40.0,
                          right: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listKonten[i].title,
                              style: const TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              listKonten[i].desc,
                              style: const TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        listKonten[i].bg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Tombol dan checkpoint
                    Container(
                      padding: const EdgeInsets.only(
                        left: 40,
                        right: 40,
                        bottom: 60,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listKonten.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 12,
                                  height: 12,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentPage == index
                                          ? Colors.white
                                          : const Color.fromRGBO(
                                              72, 22, 236, 1)),
                                );
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (currentPage < listKonten.length - 1) {
                                _pageController.animateToPage(
                                  currentPage + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              }
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SvgPicture.asset(
                                'assets/images/arrow-right.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
