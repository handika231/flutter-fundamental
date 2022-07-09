import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resto_app/model/restaurants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
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
      appBar: AppBar(
        title: const Text('Restaurants'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_yN5JrJ.json',
                height: 160,
                width: double.infinity,
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(data: data),
                            ),
                          );
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 4,
                                child: Image.network(
                                  data.pictureId,
                                  height: 80,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                flex: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data.name),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              size: 16,
                                            ),
                                            Text(
                                              data.city,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        Text(
                                          data.rating.toString(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
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
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(
              data.pictureId,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.cyan,
                        size: 24,
                      ),
                      Text(
                        data.city,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Foods',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: data.foods
                          .map(
                            (food) => Stack(
                              children: [
                                Lottie.network(
                                  'https://assets8.lottiefiles.com/packages/lf20_thgy1p9c.json',
                                  width: 200,
                                  height: 200,
                                ),
                                Positioned(
                                  top: 20,
                                  left: 12,
                                  child: Text(
                                    food['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: data.drinks
                          .map(
                            (drink) => Stack(
                              children: [
                                Lottie.network(
                                  'https://assets5.lottiefiles.com/private_files/lf30_wq2doojm.json',
                                  width: 200,
                                  height: 200,
                                ),
                                Positioned(
                                  top: 20,
                                  left: 12,
                                  child: Text(
                                    drink['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
