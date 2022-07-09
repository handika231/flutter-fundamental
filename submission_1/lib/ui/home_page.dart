import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/restaurants.dart';
import 'detail_page.dart';

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
                                flex: 6,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
