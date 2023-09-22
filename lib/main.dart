import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watery/screens/dashboard/dashboard.dart';
import 'package:watery/screens/set_limit.dart';
import 'package:watery/screens/splash_screen/splash_screen.dart';
import 'package:watery/utils/colors.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kDarkBgColor
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

