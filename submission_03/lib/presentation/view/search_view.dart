import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_03/common/navigation.dart';
import 'package:submission_03/domain/restaurant_list/restaurant.dart';
import 'package:submission_03/presentation/view/detail_view.dart';

class SearchView extends StatefulWidget {
  static const String routeName = '/search';

  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  List<Restaurant> searchResult = [];
  Future<List<Restaurant>> getSearchApi() async {
    Dio dio = Dio();
    Response response = await dio.get(
        'https://restaurant-api.dicoding.dev/search?q=${searchController.text}');
    List data = response.data['restaurants'];
    searchResult = data.map((item) => Restaurant.fromJson(item)).toList();
    return searchResult;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: TextField(
          onChanged: (value) {
            value = searchController.text;
            setState(() {});
          },
          controller: searchController,
          onSubmitted: (value) {
            searchController.text = value;
            setState(() {});
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
        ),
      ),
      body: FutureBuilder(
        future: getSearchApi(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text(
                'Tidak ada data',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return searchResult.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/empty.json',
                          width: double.infinity,
                          height: 200,
                        ),
                        const Text('Tidak ada data yang dicari'),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: searchResult.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigation.intentWithData(
                            DetailView.routeName,
                            searchResult[index],
                          );
                        },
                        child: Container(
                          color: Colors.grey[200],
                          margin: const EdgeInsets.only(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            top: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://restaurant-api.dicoding.dev/images/medium/${searchResult[index].pictureId}',
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
                                            '${searchResult[index].name}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '${searchResult[index].city}',
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
                                              '${searchResult[index].rating}',
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
}
