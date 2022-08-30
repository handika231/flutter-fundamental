import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_03/common/enum.dart';
import 'package:submission_03/presentation/provider/database_provider.dart';

import 'detail_view.dart';

class BookmarkView extends StatelessWidget {
  static const String routeName = '/bookmark';

  const BookmarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          if (value.resultState == ResultState.hasData) {
            return ListView.builder(
              itemCount: value.bookmarks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl:
                        'https://restaurant-api.dicoding.dev/images/medium/${value.bookmarks[index].pictureId}',
                  ),
                  title: Text(value.bookmarks[index].name.toString()),
                  subtitle: Text(value.bookmarks[index].city.toString()),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailView.routeName,
                      arguments: value.bookmarks[index],
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text(value.message),
            );
          }
        },
      ),
    );
  }
}
