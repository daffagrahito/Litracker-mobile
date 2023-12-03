import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litracker_mobile/data/onboardingData.dart';

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
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 33, 255, 1),
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
                        padding: EdgeInsets.only(
                          top: 60.0,
                          left: 40.0,
                          right: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listKonten[i].title,
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              listKonten[i].desc,
                              style: TextStyle(
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
                      padding: EdgeInsets.only(
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
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentPage == index
                                          ? Colors.white
                                          : Color.fromRGBO(72, 22, 236, 1)),
                                );
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (currentPage < listKonten.length - 1) {
                                _pageController.animateToPage(
                                  currentPage + 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              padding: EdgeInsets.all(14),
                              child: SvgPicture.asset(
                                'assets/images/arrow-right.svg',
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
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
