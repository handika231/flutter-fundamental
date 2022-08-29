import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:submission_03/data/utils/background_service.dart';
import 'package:submission_03/data/utils/notification_helper.dart';

import 'application/app.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService backgroundService = BackgroundService();
  backgroundService.initIsolate();
  await AndroidAlarmManager.initialize();
  await notificationHelper.initNotification(flutterLocalNotificationsPlugin);
  runApp(const Application());
}
