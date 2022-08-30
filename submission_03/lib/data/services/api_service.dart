import 'package:dio/dio.dart';
import 'package:submission_03/domain/restaurant_detail/restaurant_detail.dart';
import 'package:submission_03/domain/restaurant_list/restaurant.dart';

import '../../domain/restaurant_list/restaurant_list.dart';

class ApiService {
  Dio _dio = Dio();
  ApiService([Dio? dio]) {
    if (dio != null) {
      _dio = dio;
    }
  }
  Future<RestaurantList> getRestaurantList() async {
    try {
      Response response =
          await _dio.get('https://restaurant-api.dicoding.dev/list');
      final results = RestaurantList.fromJson(response.data);
      return results;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final response =
          await _dio.get('https://restaurant-api.dicoding.dev/detail/$id');
      if (response.statusCode == 200) {
        return RestaurantDetail.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Restaurant>> getSearchApi(String name) async {
    try {
      Response response =
          await _dio.get('https://restaurant-api.dicoding.dev/search?q=$name');
      List<Restaurant> results = response.data['restaurants']
          .map((item) => Restaurant.fromJson(item))
          .toList();
      return results;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
