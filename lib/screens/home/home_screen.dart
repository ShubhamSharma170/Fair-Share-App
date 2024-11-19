import 'package:fair_share/constants/colors.dart';
import 'package:fair_share/screens/home/home_content_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  // List of pages for each tab
  final List<Widget> _pages = [
    HomeContentScreen(),
    Center(
        child: Text('Profile Page',
            style: TextStyle(fontSize: 20, color: whiteColor))),
    Center(
        child: Text('Settings Page',
            style: TextStyle(fontSize: 20, color: whiteColor))),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashbackgroundColor,
        resizeToAvoidBottomInset: false,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: whiteColor,
          unselectedItemColor: greyColor,
          backgroundColor: splashbackgroundColor,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: whiteColor,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: whiteColor,
                ),
                label: "Friends"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: whiteColor,
                ),
                label: "settings"),
          ],
        ),
      ),
    );
  }
}
