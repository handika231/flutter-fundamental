import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/restaurant/restaurant.dart';

class HomeController extends GetxController {
  Connectivity connectivity = Connectivity();

  Future<Restaurant> getDataApi() async {
    Uri url = Uri.parse('https://restaurant-api.dicoding.dev/list');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Restaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  List restaurantList = [];
}
