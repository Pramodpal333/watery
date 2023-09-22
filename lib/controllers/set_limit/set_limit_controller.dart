
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:watery/controllers/dashboard_controller.dart';
import 'package:watery/screens/dashboard/dashboard.dart';
import 'package:watery/utils/constants.dart';
import 'package:watery/utils/custom_print.dart';
import 'package:watery/utils/insert_data.dart';

class SetLimitController extends GetxController{
  TextEditingController limitCon = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void validate() {
    if(limitCon.text.isNotEmpty){
      int limit = int.parse(limitCon.text);
      CustomStorage().saveData(AppConstant.dailyTarget, limit);
      CustomStorage().saveData(AppConstant.loggedIn, true);
      Get.delete<DashboardController>();
      Get.offAll(()=>DashboardScreen());
    }


    println(">>>>>>> ${limitCon.text}");
  }
}