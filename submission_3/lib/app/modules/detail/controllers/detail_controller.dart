import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:submission_2/app/modules/detail/model/detail_model/detail_model.dart';

class DetailController extends GetxController {
  Future<DetailModel> getDataDetail(String id) async {
    Uri url = Uri.parse('https://restaurant-api.dicoding.dev/detail/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return DetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
