import 'package:flutter/material.dart';
import 'package:litracker_mobile/data/bottomNavData.dart';
import 'history.dart'; // Import your HistoryContent class
import 'home.dart';
import 'profile.dart';
import 'review.dart';

class NavigateUser extends StatefulWidget {
  const NavigateUser({Key? key}) : super(key: key);

  @override
  _NavigateUserState createState() => _NavigateUserState();
}

class _NavigateUserState extends State<NavigateUser> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Content that can be scrolled
                  _getContentWidget(),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            currentIndex: _currentIndex,
            items: BottomNavData.bottomNavBarItems,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _getContentWidget() {
    switch (_currentIndex) {
      case 0:
        return HomeContent();
      case 1:
        return ReviewContent();
      case 2:
        return HistoryContent();
      case 3:
        return ProfileContent();
      default:
        return Container();
    }
  }
}
