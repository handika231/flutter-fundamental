import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'INI HOME VIEW',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
