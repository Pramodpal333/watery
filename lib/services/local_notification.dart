import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  // Instance of Flutternotification plugin
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();


  static void initialize() {
    // Initialization  setting for android
    const InitializationSettings initializationSettingsAndroid =
    InitializationSettings(
        android: AndroidInitializationSettings("logo",));
    _notificationsPlugin.initialize(
      initializationSettingsAndroid,
      // to handle event when we receive notification
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {
          print(">>>>>>>>>>>>>> $details");
          print(">>>>>>>>>>>>>> ${details.payload}");
        }
      },
    );
  }


  static void sendNotification(String title,String body) async {
    try {
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'call_ringtone', 'high_importance_channel',
        importance: Importance.max,
        priority: Priority.high,
        sound:RawResourceAndroidNotificationSound("bubble"),
        playSound: true
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _notificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails);
    } catch (e) {
      debugPrint( ">>>>>>>>> "+ e.toString());
    }
  }

  static Future<void> display(String message) async {
    // To display the notification in device
    try {
      print(message);
      print("<<<<<<<<<<<");
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("default_notification_channel_id", "default_notification_channel_id channel",
            importance: Importance.max,
            sound: RawResourceAndroidNotificationSound("bubble"),

            // different sound for
            // different notification
            playSound: true,
            priority: Priority.high),
      );
      await _notificationsPlugin.show(id, "Title",
          "message.notification?.body", notificationDetails,
          payload: "message.data['route']");
    } catch (e) {
      debugPrint(e.toString());
    }
  }



  static void scheduleNotification(String title,String body) async {

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'call_ringtone', 'high_importance_channel',
        importance: Importance.max,
        priority: Priority.high,
        sound:RawResourceAndroidNotificationSound("bubble"),
        playSound: true
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _notificationsPlugin.periodicallyShow(
        0,
        'scheduled title',
        'scheduled body',
        RepeatInterval.hourly,
        notificationDetails);
  }
}