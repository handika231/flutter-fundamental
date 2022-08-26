import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  static const String routeName = '/setting';
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'INI SETTING VIEW',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
