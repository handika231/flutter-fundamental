import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_03/presentation/view/detail_view.dart';

import '../../common/enum.dart';
import '../provider/home_provider.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildList(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Restaurant App'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 2,
      foregroundColor: Colors.black,
    );
  }

  _buildList() {
    return Consumer<HomeProvider>(
      builder: (context, HomeProvider provider, child) {
        if (provider.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.state == ResultState.error) {
          return Center(
            child: Text(provider.message),
          );
        } else {
          return ListView.builder(
            itemCount: provider.restaurantList.restaurants!.length,
            itemBuilder: (BuildContext context, int index) {
              final restaurant = provider.restaurantList.restaurants![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailView.routeName,
                      arguments: restaurant);
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
                              'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    restaurant.city.toString(),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      '${restaurant.rating}',
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
    );
  }
}
