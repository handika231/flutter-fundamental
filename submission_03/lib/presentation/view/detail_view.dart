import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_03/data/services/api_service.dart';
import 'package:submission_03/domain/restaurant_detail/restaurant_detail.dart';
import 'package:submission_03/domain/restaurant_list/restaurant.dart';

class DetailView extends StatelessWidget {
  static const String routeName = '/detail';

  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant =
        ModalRoute.of(context)?.settings.arguments as Restaurant;
    return Scaffold(
      body: FutureBuilder<RestaurantDetail>(
        future: ApiService().getRestaurantDetail(restaurant.id.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            RestaurantDetail? restaurantDetail = snapshot.data;
            return _buildView(restaurant, restaurantDetail);
          }
        },
      ),
    );
  }

  _buildView(Restaurant restaurant, RestaurantDetail? restaurantDetail) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            '${restaurant.name}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl:
                  'https://restaurant-api.dicoding.dev/images/medium/${restaurantDetail?.restaurant?.pictureId}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 24, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${restaurantDetail?.restaurant?.name}',
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
                              '${restaurantDetail?.restaurant?.city}',
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
                              '${restaurantDetail?.restaurant?.rating}',
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
                          children: restaurantDetail!.restaurant!.categories!
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
                      '${restaurantDetail.restaurant!.description}',
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
                        children: restaurantDetail.restaurant!.menus!.foods!
                            .map(
                              (e) => Card(
                                elevation: 6,
                                color: Colors.grey[200],
                                margin: const EdgeInsets.only(
                                  right: 16,
                                  bottom: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
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
                        children: restaurantDetail.restaurant!.menus!.drinks!
                            .map(
                              (e) => Card(
                                elevation: 6,
                                color: Colors.grey[200],
                                margin: const EdgeInsets.only(
                                  right: 16,
                                  bottom: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
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
                      children: restaurantDetail.restaurant!.customerReviews!
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
}
