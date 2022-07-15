import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:submission_2/app/modules/home/model/restaurant/restaurant.dart';

class SearchController extends GetxController {
  List<Restaurants> searchResult = [];
  var searchController = TextEditingController();
  Future<List<Restaurants>> getSeachApi() async {
    Uri uri = Uri.parse(
        'https://restaurant-api.dicoding.dev/search?q=${searchController.value.text}');
    final response = await http.get(uri);
    List data = json.decode(response.body)['restaurants'];
    searchResult = data.map((e) => Restaurants.fromJson(e)).toList();
    return searchResult;
  }
}
