import 'package:flutter/material.dart';

import 'view.dart';

class MainView extends StatefulWidget {
  static const String routeName = '/';

  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Bookmarks',
    ),
  ];

  final List<Widget> _children = [
    const HomeView(),
    const SettingView(),
    const BookmarkView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
        items: _bottomNavItems,
      ),
    );
  }
}
