import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ShowLocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(details) {}

  static Future<void> init() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/ic_launcher"),
          iOS: DarwinInitializationSettings(),
        );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static showBasicNotification({
    required String code,
    required String message,
  }) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId",
        "channelName",
        importance: Importance.max,
        priority: Priority.min,
      ),
      iOS: DarwinNotificationDetails(),
    );
    flutterLocalNotificationsPlugin.show(0, message, code, notificationDetails);
  }
}
