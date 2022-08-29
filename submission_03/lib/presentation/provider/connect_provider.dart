import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectProvider {
  static final Connectivity _connectivity = Connectivity();
  //getter
  Connectivity get connectivity => _connectivity;
  static Future<ConnectivityResult> getConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
