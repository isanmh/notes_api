import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:notes_api/pages/notes_modules/home_page.dart';
import 'package:notes_api/pages/post_page.dart';
import 'package:notes_api/pages/user_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPage = 0;

  List<Widget> pages = [
    HomePage(),
    PostPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                currentPage = index;
              });
            },
            gap: 5,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple.shade800,
            padding: const EdgeInsets.all(12),
            tabBorderRadius: 20,
            curve: Curves.easeInOutExpo,
            tabBackgroundGradient: const LinearGradient(
              colors: [
                Color(0xFFD661E0),
                Colors.deepPurpleAccent,
              ],
            ),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            haptic: true,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.article,
                text: 'News',
              ),
              GButton(
                icon: Icons.people,
                text: 'Users',
              ),
            ],
          ),
        ),
      ),
      body: pages[currentPage],
    );
  }
}
