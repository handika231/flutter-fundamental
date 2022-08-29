import 'dart:isolate';
import 'dart:ui';

import 'package:submission_03/data/services/api_service.dart';
import 'package:submission_03/data/utils/notification_helper.dart';

import '../../main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  //create singleton instance
  static final BackgroundService _instance = BackgroundService._internal();
  factory BackgroundService() => _instance;
  BackgroundService._internal();

  static const String _isolateName = 'background_service';
  static SendPort? _uiSendPort;
  void initIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await ApiService().getRestaurantList();
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
