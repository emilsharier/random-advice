import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_advice/services/notificiation_service.dart';
import 'package:random_advice/screens/home_screen.dart';

main(List<String> args) async {
  // Flutter essential
  WidgetsFlutterBinding.ensureInitialized();

  // Local notification initialization
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  FlutterLocalNotificationsPlugin notif = FlutterLocalNotificationsPlugin();
  await notif.initialize(initializationSettings,
      onSelectNotification: NotificationService().onSelectNotification);

  // Initialising android alarm manager
  await AndroidAlarmManager.initialize();
  // Fetching application document directory
  final appDocumentDir = await getApplicationDocumentsDirectory();
  // Initialising
  Hive.init(appDocumentDir.path);
  // Starting point for app life cycle
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random advice",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
