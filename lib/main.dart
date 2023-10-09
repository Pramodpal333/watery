import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watery/screens/dashboard/dashboard.dart';
import 'package:watery/screens/set_limit.dart';
import 'package:watery/screens/splash_screen/splash_screen.dart';
import 'package:watery/services/local_notification.dart';
import 'package:watery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
try{
  print("Native called background task: $task"); //simpleTask will be emitted here.
  print("Native called background task: $inputData"); //simpleTask will be emitted here.
}catch(e){
  print("Error in workmanager + $e");
}
    return Future.value(true);
  });
}

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  runApp(const MyApp());
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
  Workmanager().registerOneOffTask(
    "1",
    "printMessageTask",
    initialDelay: Duration(hours: 1), // Delay before the first execution.
  );

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestNotificationPermissions();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kDarkBgColor,
          useMaterial3: true
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

Future<void> requestNotificationPermissions() async {
  final status = await [
    Permission.notification,
    Permission.accessNotificationPolicy,
  ].request();


}
