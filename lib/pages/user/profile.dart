// ignore_for_file: use_build_context_synchronously
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';

import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/auth/loginPage.dart';
import 'package:litracker_mobile/data/models/user.dart';
import 'package:litracker_mobile/pages/user/wishlistList.dart';
import 'package:litracker_mobile/upvote/profile/upvoteList.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  int totalUpvotedBooks = 0;
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchUserData() async {
    final request = context.watch<CookieRequest>();
    final responseVotes = await request
        .get('http://localhost:8080/upvote_book/get_upvoted_books/');

    int total_votes = responseVotes['total_upvoted_books'];

    @override
    void initState() {
      super.initState();
      totalUpvotedBooks = total_votes;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    fetchUserData();

    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Transform.scale(
            scale: 2.0,
            child: Image.asset("assets/profile/profile-bg.png"),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Profil Saya",
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(8, 4, 22, 1),
                            letterSpacing: -0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 247, 249, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/profile/profile-picture.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Halo,",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(132, 151, 172, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              loggedInUser?.username ?? "Default Username",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontFamily: 'SF-Pro',
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(8, 4, 22, 1),
                                fontSize: 20,
                                letterSpacing: -0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpVoteList(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(246, 247, 249, 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/profile/profile-upvote.png'),
                                  const SizedBox(width: 16),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 240,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "$totalUpvotedBooks", // Display total votes here
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -0.5,
                                            color: Color.fromRGBO(8, 4, 22, 1),
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          "Buku Kamu Upvote",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                132, 151, 172, 1),
                                            fontSize: 12,
                                            letterSpacing: -0.7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                  'assets/profile/profile-directto.png'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WishlistList(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(246, 247, 249, 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                      'assets/profile/profile-wishlist.png'),
                                  const SizedBox(width: 16),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 240,
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "", // Display total wishlist here
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -0.5,
                                            color: Color.fromRGBO(8, 4, 22, 1),
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Buku di Wishlistmu",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                132, 151, 172, 1),
                                            fontSize: 12,
                                            letterSpacing: -0.7,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                  'assets/profile/profile-directto.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final response = await request
                            .logout("http://localhost:8080/logout-mobile/");
                        String message = response["message"];
                        if (response['status']) {
                          String uname = response["username"];
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Text(
                                      '${message} Sampai jumpa ${uname}!',
                                      style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor:
                                  jaguar600, // Anda dapat menyesuaikan warnanya
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.85,
                                  left: 40,
                                  right: 40),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$message"),
                          ));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 22,
                        ),
                        alignment: Alignment.centerRight,
                        height: 52,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromRGBO(236, 239, 242, 1),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Logout",
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 4, 22, 1),
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/profile/profile-logout.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
