import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/restaurants.dart';

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
