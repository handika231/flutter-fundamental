import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:submission_03/domain/restaurant_list/restaurant_list.dart';

import '../../common/navigation.dart';

final selectNotification = BehaviorSubject<String>();

class NotificationHelper {
  //create singleton
  static final NotificationHelper _instance = NotificationHelper._internal();
  factory NotificationHelper() => _instance;
  NotificationHelper._internal();
  Random random = Random();

  Future initNotification(FlutterLocalNotificationsPlugin notification) async {
    var initAndroid = const AndroidInitializationSettings('app_icon');
    var initIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initPlatform =
        InitializationSettings(android: initAndroid, iOS: initIOS);
    await notification.initialize(
      initPlatform,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          debugPrint(
            'notification payload: $payload',
          );
        }
        selectNotification.add(
          payload ?? "Empty Payload",
        );
      },
    );
  }

  Future showNotification(FlutterLocalNotificationsPlugin notification,
      RestaurantList restaurantList) async {
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "Restaurant List";
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: const DefaultStyleInformation(
        true,
        true,
      ),
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var titleNotification = "<b>Recommended Restaurant</b>";
    var randomRestaurant = restaurantList.restaurants![random.nextInt(
      restaurantList.restaurants!.length + 1,
    )];
    var titleNews = randomRestaurant.name;
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await notification.show(
      0,
      titleNotification,
      titleNews,
      platformChannelSpecifics,
      payload: json.encode(
        restaurantList.toJson(),
      ),
    );
  }

  configureNotificationSubject(
    String route,
  ) {
    selectNotification.stream.listen(
      (String payload) async {
        var data = RestaurantList.fromJson(json.decode(payload));
        var restaurantItem = data.restaurants![random.nextInt(
          data.restaurants!.length + 1,
        )];
        Navigation.intentWithData(
          route,
          restaurantItem,
        );
      },
    );
  }
}
