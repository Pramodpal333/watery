import 'package:flutter/material.dart';
import 'package:watery/controllers/splash_screen/splash_controller.dart';
import 'package:get/get.dart';
import 'package:watery/utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController controller =Get.put(SplashController());
    return Scaffold(
      body: Obx(()=>Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 2), // Adjust the duration as needed
            width: controller.isLogoExpanded.value ? 300 : 100, // Initial and final widths
            height: controller.isLogoExpanded.value ? 300 : 100, // Initial and final heights
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              // border: Border.all(width: 1, color: Colors.white),
            ),
            child: Image.asset(appLogo),
          ),
        ),
      ),
    );
  }
}
