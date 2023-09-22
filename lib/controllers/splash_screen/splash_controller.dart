import 'dart:async';

import 'package:get/get.dart';
import 'package:watery/screens/dashboard/dashboard.dart';
import 'package:watery/screens/set_limit.dart';
import 'package:watery/utils/constants.dart';
import 'package:watery/utils/insert_data.dart';

class SplashController extends GetxController{
  var isLogoExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Add your animation logic here, e.g., trigger logo expansion after a delay.
   initTask();
  }

  void initTask() {
    Future.delayed(Duration(seconds: 1), () {
      isLogoExpanded.value = true;
      // update(); // Trigger a rebuild to apply the animation.
    });
    Timer(const Duration(seconds: 3),(){
      var loggedIn = CustomStorage().readData(AppConstant.loggedIn) ?? false;
      Get.to(()=> loggedIn ? DashboardScreen():SetLimitScreen(showBack: false,));
    });
  }
}