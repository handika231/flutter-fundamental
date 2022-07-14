import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:submission_2/app/modules/home/model/restaurant/restaurant.dart';
import 'package:submission_2/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Future getData() async {
    Uri url = Uri.parse('https://restaurant-api.dicoding.dev/list');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: controller.connectivity.onConnectivityChanged,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null ||
              snapshot.data == ConnectivityResult.none) {
            return const Scaffold(
              body: Center(
                child: Text('No Internet Connection'),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Restaurant App'),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 2,
                foregroundColor: Colors.black,
              ),
              body: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Restaurant? restaurant = snapshot.data;
                  if (snapshot.data == null ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: restaurant?.restaurants?.length,
                      itemBuilder: (BuildContext context, int index) {
                        Restaurants? restaurants =
                            restaurant?.restaurants?[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL, arguments: restaurants);
                          },
                          child: Container(
                            color: Colors.grey[200],
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Image.network(
                                    'https://restaurant-api.dicoding.dev/images/medium/${restaurants!.pictureId}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              restaurants.name!,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              restaurants.city!,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Colors.yellow),
                                              Text(
                                                '${restaurants.rating}',
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
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
            );
          }
        });
  }
}
