import 'package:flutter/material.dart';
import 'package:submission_03/domain/restaurant_list/restaurant_list.dart';

import '../../common/enum.dart';
import '../../data/services/api_service.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService service;
  HomeProvider({required this.service}) {
    _fetchAllList();
  }

  late RestaurantList _restaurantList;
  late ResultState _state;
  String _message = '';
  RestaurantList get restaurantList => _restaurantList;
  ResultState get state => _state;
  String get message => _message;

  Future _fetchAllList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final data = await service.getRestaurantList();
      if (data.restaurants!.isEmpty) {
        //CHECK LIST
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantList = data;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}
