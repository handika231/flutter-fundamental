import 'dart:convert';

import 'package:flutter/material.dart';

class RestaurantModel {
  String name, description, pictureId, city, rating;
  List foods;
  List drinks;
  RestaurantModel(
      {required this.name,
      required this.description,
      required this.rating,
      required this.pictureId,
      required this.foods,
      required this.drinks,
      required this.city});
  static RestaurantModel fromJson(json) {
    return RestaurantModel(
      drinks: json['menus']['drinks'],
      name: json['name'],
      city: json['city'],
      pictureId: json['pictureId'],
      description: json['description'],
      rating: json['rating'].toString(),
      foods: json['menus']['foods'],
    );
  }
}

Future<List<RestaurantModel>> getData(BuildContext context) async {
  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/data.json');
  final List body = json.decode(data)['restaurants'];
  return body.map((e) => RestaurantModel.fromJson(e)).toList();
}
