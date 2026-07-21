import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../flavors.dart';

class NotificationHelper {
  final _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationsSettings = InitializationSettings(
        android: AndroidInitializationSettings({
              Flavor.casmex: 'icon_noti',
              Flavor.lmpay: 'icon_noti',
              Flavor.cityexchangeuae: 'icon_noti',
              Flavor.lakhoos: 'icon_noti',
            }[F.appFlavor] ??
            'icon_noti'),
        iOS: const DarwinInitializationSettings(requestAlertPermission: true, requestBadgePermission: true, requestSoundPermission: true));
    try {
      flutterLocalNotificationsPlugin.initialize(
        initializationsSettings,
        onDidReceiveNotificationResponse: (NotificationResponse? n) {
          return;
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((message) {
      if (Platform.isAndroid) {
        NotificationHelper.showBgNotification(message, flutterLocalNotificationsPlugin);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      NotificationHelper.showBgNotification(message, flutterLocalNotificationsPlugin);
    });
  }

  static Future<void> showBgNotification(
    RemoteMessage msg,
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  ) async {
    final String? imageUrl = msg.data['image'];
    final String title = msg.data['title'] ?? '';
    final String body = msg.data['body'] ?? '';

    AndroidNotificationDetails androidDetails;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      final BigPictureStyleInformation bigPicture = BigPictureStyleInformation(
        FilePathAndroidBitmap(await _downloadAndSaveFile(imageUrl, 'notif_image.jpg')),
        contentTitle: title,
        summaryText: body,
      );

      androidDetails = AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        styleInformation: bigPicture,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        icon: _getFlavorIcon(),
        largeIcon: DrawableResourceAndroidBitmap(_getFlavorIcon()),
      );
    } else {
      final BigTextStyleInformation bigText = BigTextStyleInformation(
        body,
        contentTitle: title,
        htmlFormatContentTitle: true,
        htmlFormatBigText: true,
      );

      androidDetails = AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        styleInformation: bigText,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        icon: _getFlavorIcon(),
        largeIcon: DrawableResourceAndroidBitmap(_getFlavorIcon()),
      );
    }

    final NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(threadIdentifier: "high_importance_channel"),
    );

    await flutterLocalNotificationsPlugin.show(msg.data.hashCode, title, body, details);
  }

  static String _getFlavorIcon() {
    return {
          Flavor.casmex: 'icon_noti',
          Flavor.lmpay: 'icon_noti',
          Flavor.cityexchangeuae: 'icon_noti',
          Flavor.lakhoos: 'icon_noti',
        }[F.appFlavor] ??
        'icon_noti';
  }

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getTemporaryDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
