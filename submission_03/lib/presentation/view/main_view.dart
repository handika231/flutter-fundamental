import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../provider/connect_provider.dart';
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
      icon: Icon(Icons.favorite),
      label: 'Favorite',
    ),
  ];

  final List<Widget> _children = [
    const HomeView(),
    const SettingView(),
    const FavoriteView(),
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: ConnectProvider().connectivity.onConnectivityChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == ConnectivityResult.none) {
          return widgetFailed();
        } else {
          return widgetSuccess();
        }
      },
    );
  }

  widgetFailed() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/connection.json',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  widgetSuccess() {
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
