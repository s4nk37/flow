import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../errors/exceptions.dart';
import '../configs/app_config.dart';
import '../utils/theme/app_colors.dart';

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel',
  'Flow High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

final _notificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    _channel.id,
    _channel.name,
    channelDescription: _channel.description,
    importance: _channel.importance,
    priority: Priority.high,
    color: AppColors.indigo,
    enableLights: true,
  ),
  iOS: const DarwinNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  ),
);

void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    logger.d('notification payload: $payload');
  }
  // await Navigator.push(
  //   context,
  //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
  // );
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) => CupertinoAlertDialog(
  //     title: Text(title),
  //     content: Text(body),
  //     actions: [
  //       CupertinoDialogAction(
  //         isDefaultAction: true,
  //         child: Text('Ok'),
  //         onPressed: () async {
  //           Navigator.of(context, rootNavigator: true).pop();
  //           await Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => SecondScreen(payload),
  //             ),
  //           );
  //         },
  //       )
  //     ],
  //   ),
  // );
}

class LocalNotificationService {
  LocalNotificationService._();
  // Instance of Flutternotification plugin
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  ///Requesting permissions on Android 13 or higher
  static Future<bool?> requestPermission() async {
    try {
      return await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    } on Exception {
      throw PermissionException();
    }
  }

  /// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  static Future<void> initialize() async {
    //Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    //ios
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification,
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true);

    //linux
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    //initialization settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  ///Show a notification
  static Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    return _notificationsPlugin.show(
      0,
      title,
      body,
      _notificationDetails,
      payload: payload,
    );
  }

  ///Show a notification after a specific duration
  static Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    return _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      _notificationDetails,
      // androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  ///Show a notification periodically at a specific time
  static Future<void> showPeriodicNotification({
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
    RepeatInterval repeatInterval = RepeatInterval.daily,
  }) async {
    return _notificationsPlugin.periodicallyShow(
      0,
      title,
      body,
      repeatInterval,
      _notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  //Retrieve the list of active notifications
  static Future<List<ActiveNotification>> getActiveNotifications() async =>
      await _notificationsPlugin.getActiveNotifications();

  //Retrieve the list of scheduled/pending notifications
  static Future<List<PendingNotificationRequest>>
      getPendingNotifications() async =>
          await _notificationsPlugin.pendingNotificationRequests();

  // Cancel a notification
  static Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  // Cancel all notifications
  static Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }

  //Getting details on if the app was launched via a notification created by this plugin
  static Future<NotificationAppLaunchDetails?>
      getNotificationAppLaunchDetails() async =>
          await _notificationsPlugin.getNotificationAppLaunchDetails();
}
