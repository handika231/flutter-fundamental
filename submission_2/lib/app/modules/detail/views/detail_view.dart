import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_2/app/modules/detail/model/detail_model/detail_model.dart';
import 'package:submission_2/app/modules/home/model/restaurant/restaurant.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  final Restaurants data = Get.arguments as Restaurants;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DetailModel>(
        future: controller.getDataDetail(data.id.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            DetailModel detail = snapshot.data;

            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  title: Text(
                    '${data.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  expandedHeight: 250,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/${detail.restaurant!.pictureId}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 16, top: 24, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${detail.restaurant!.name}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '${detail.restaurant!.city}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${detail.restaurant!.rating}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                const Text('Categories : '),
                                Row(
                                  children: detail.restaurant!.categories!
                                      .map(
                                        (e) => Text(
                                          '${e.name}, ',
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '${detail.restaurant!.description}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              'Foods',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: detail.restaurant!.menus!.foods!
                                    .map(
                                      (e) => Card(
                                        elevation: 6,
                                        color: Colors.grey[200],
                                        margin: const EdgeInsets.only(
                                          right: 16,
                                          bottom: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Stack(
                                          children: [
                                            Lottie.network(
                                              'https://assets7.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json',
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Text('${e.name}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const Text(
                              'Drinks',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: detail.restaurant!.menus!.drinks!
                                    .map(
                                      (e) => Card(
                                        elevation: 6,
                                        color: Colors.grey[200],
                                        margin: const EdgeInsets.only(
                                          right: 16,
                                          bottom: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Stack(
                                          children: [
                                            Lottie.network(
                                              'https://assets9.lottiefiles.com/packages/lf20_rnnrduuq.json',
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Text('${e.name}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: detail.restaurant!.customerReviews!
                                  .map(
                                    (e) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama : ${e.name}'),
                                        Text('Review : ${e.review}'),
                                        Text('Tanggal : ${e.date}'),
                                        const Divider(),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
