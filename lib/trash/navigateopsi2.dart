import 'package:flutter/material.dart';
import '../pages/user/history.dart'; // Import your HistoryContent class
import '../book/pages/home.dart';
import '../pages/user/profile.dart';
import '../pages/user/review.dart';

class NavigateUser2 extends StatefulWidget {
  const NavigateUser2({Key? key}) : super(key: key);

  @override
  _NavigateUser2State createState() => _NavigateUser2State();
}

class _NavigateUser2State extends State<NavigateUser2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

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
          _buildCustomNavigationBar(),
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

  Widget _buildCustomNavigationBar() {
    return Container(
      color: const Color.fromRGBO(72, 22, 236, 1),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 32,
        left: 40,
        right: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, 'Beranda', 'assets/navbar/home-secondary.png',
              'assets/navbar/home-primary.png'),
          _buildNavItem(1, 'Ulas', 'assets/navbar/review-secondary.png',
              'assets/navbar/review-primary.png'),
          _buildNavItem(2, 'Riwayat', 'assets/navbar/history-secondary.png',
              'assets/navbar/history-primary.png'),
          _buildNavItem(3, 'Profil', 'assets/navbar/profile-secondary.png',
              'assets/navbar/profile-primary.png'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      int index, String label, String imagePath, String activeImagePath) {
    bool isSelected = index == _currentIndex;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        _animateNavItems();
      },
      child: Hero(
        tag: 'navItem_$index',
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 40,
                height: isSelected ? 40 : 40,
                child: Image.asset(
                  isSelected ? activeImagePath : imagePath,
                  width: 40,
                  height: 40,
                ),
                margin: EdgeInsets.only(
                  left: isSelected ? 32 : 0,
                  right: isSelected ? 8 : 0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: isSelected ? 32 : 0,
                ),
                child: Visibility(
                  visible: isSelected,
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF-Pro',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animateNavItems() {
    for (int i = 0; i < 4; i++) {
      if (i != _currentIndex) {
        _animationController.reset();
        _animationController.forward();
      }
    }
  }
}
