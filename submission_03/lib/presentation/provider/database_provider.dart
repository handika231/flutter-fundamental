import 'package:flutter/cupertino.dart';
import 'package:submission_03/common/enum.dart';
import 'package:submission_03/data/db/database_helper.dart';
import 'package:submission_03/domain/restaurant_list/restaurant.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;
  DatabaseProvider({required this.databaseHelper}) {
    _getBookmarks();
  }

  late ResultState _resultState;
  ResultState get resultState => _resultState;
  String _message = '';
  String get message => _message;
  List<Restaurant> _bookmarks = [];
  List<Restaurant> get bookmarks => _bookmarks;

  void _getBookmarks() async {
    _bookmarks = await databaseHelper.getBookmark();
    if (_bookmarks.isNotEmpty) {
      _resultState = ResultState.hasData;
    } else {
      _resultState = ResultState.noData;
      _message = 'No bookmark yet';
    }
    notifyListeners();
  }

  void addBookmark(Restaurant restaurant) async {
    try {
      await databaseHelper.insertBookmark(restaurant);
      _getBookmarks();
    } catch (e) {
      _resultState = ResultState.error;
      _message = e.toString();
      notifyListeners();
    }
  }

  Future<bool> isBookmarked(String id) async {
    var bookmarks = await databaseHelper.getBookmarkById(id);
    return bookmarks.isNotEmpty;
  }

  Future removeBookmark(String id) async {
    try {
      await databaseHelper.removeBookmark(id);
      _getBookmarks();
    } catch (e) {
      _resultState = ResultState.error;
      _message = e.toString();
      notifyListeners();
    }
  }
}
