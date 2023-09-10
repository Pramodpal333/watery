import 'package:flutter/material.dart';
import 'package:watery/screens/dashboard/dashboard.dart';
import 'package:watery/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kDarkBgColor
      ),
      home: DashboardScreen(),
    );
  }
}

