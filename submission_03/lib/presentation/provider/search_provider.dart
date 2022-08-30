import 'package:flutter/material.dart';
import 'package:submission_03/domain/restaurant_list/restaurant.dart';

import '../../common/enum.dart';
import '../../data/services/api_service.dart';

class SearchProvider extends ChangeNotifier {
  List<Restaurant> _data = [];
  List<Restaurant> get data => _data;
  TextEditingController searchController = TextEditingController();
  final ApiService service;
  SearchProvider({required this.service}) {
    _fetchSearchList();
  }
  late ResultState _state;
  String _message = '';
  ResultState get state => _state;
  String get message => _message;

  Future getSearchData() async {
    final results = await service.getSearchApi(searchController.text);
    notifyListeners();
    return results;
  }

  Future _fetchSearchList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final apiSearch = await service.getSearchApi(searchController.text);
      if (apiSearch.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _data = apiSearch;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}
