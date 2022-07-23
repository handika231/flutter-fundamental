import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  //create method search in textfield

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (controller) => StreamBuilder<ConnectivityResult>(
        stream: controller.connectivity.onConnectivityChanged,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == ConnectivityResult.none) {
            return Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/connection.json',
                    width: Get.width,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'No Internet Connection',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: TextField(
                  onChanged: (value) {
                    value = controller.searchController.text;
                    controller.update();
                  },
                  controller: controller.searchController,
                  onSubmitted: (value) {
                    controller.searchController.text = value;
                    controller.update();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                  ),
                ),
                centerTitle: true,
              ),
              body: FutureBuilder(
                future: controller.getSeachApi(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text('No Data...'),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return controller.searchResult.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.searchResult.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL,
                                      arguments:
                                          controller.searchResult[index]);
                                },
                                child: Container(
                                  color: Colors.grey[200],
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://restaurant-api.dicoding.dev/images/medium/${controller.searchResult[index].pictureId}',
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
                                                    '${controller.searchResult[index].name}',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    '${controller.searchResult[index].city}',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const Icon(Icons.star,
                                                        color: Colors.yellow),
                                                    Text(
                                                      '${controller.searchResult[index].rating}',
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
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/empty.json',
                                  width: Get.width,
                                  height: 200,
                                ),
                                const Text('Tidak ada data yang dicari'),
                              ],
                            ),
                          );
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
