import 'package:flutter/material.dart';
import 'package:resto_app/model/restaurants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(context),
        builder: (BuildContext context,
            AsyncSnapshot<List<RestaurantModel>?> snapshot) {
          List<RestaurantModel>? restaurants = snapshot.data;
          if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: restaurants?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                RestaurantModel? data = restaurants![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(data: data),
                      ),
                    );
                  },
                  title: Text(data.name),
                  subtitle: Text(
                    data.city,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final RestaurantModel data;
  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          data.pictureId,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
