import 'package:flutter/material.dart';

class BookmarkView extends StatelessWidget {
  static const String routeName = '/bookmark';

  const BookmarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'INI BOOKMARK VIEW',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
