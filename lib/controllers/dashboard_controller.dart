import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:watery/models/drinks_model.dart';
import 'package:watery/utils/colors.dart';
import 'package:watery/utils/constants.dart';
import 'package:watery/utils/custom_print.dart';
import 'package:watery/utils/db_helper.dart';
import 'package:watery/widgets/date_picker.dart';

import '../widgets/textfeild.dart';

class DashboardController extends GetxController {
  var totalDrink = 0.obs;
  var targetDrink = 4000.obs;
  var alreadyDrank = 0.0.obs;

  TextEditingController updateDrinkCon = TextEditingController();
  TextEditingController drinkTimeCon = TextEditingController();
  Time _time = Time(hour: 11, minute: 30, second: 20);

  // var drinkList = RxList<DrinksModel>();
  final RxList<DrinksModel> drinkList = <DrinksModel>[].obs;

  GetStorage box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initTask();
  }

  initTask() async {
    try {
      refresh();
    } catch (e) {
      println("init exception dashboard > $e");
      throw Exception(e);
    }
  }

  Future<void> refresh() async {
    try {
      int? savedTarget = box.read(AppConstant.dailyTarget);
      targetDrink.value = savedTarget ?? 3000;
      var drinks = await DbHelper.getDrinks();
      println("drinks init $drinks");
      // Convert the List<Map<String, dynamic>> to RxList<DrinksModel>
      final convertedList =
          drinks.map((map) => DrinksModel.fromJson(map)).toList();
      drinkList.assignAll(convertedList);
      totalDrink.value = drinkList.fold(0, (quantity, drink) {
        return quantity += drink.qty!;
      });
      alreadyDrank.value = totalDrink.value / targetDrink.value;
      println("Refreshed $totalDrink");
    } catch (e) {
      println("refresh exception dashboard > $e");
      throw Exception(e);
    }
  }

  // Function to add drinks to table
  addDrinkFun(int liter) async {
    try {
      totalDrink.value += liter;
      dynamic currentTime = DateFormat.Hm().format(DateTime.now());
      // dynamic currentDate = DateFormat.yMMMd().format(DateTime.now());
      // drinkList.add(
      //     DrinksModel(qty: liter, date: DateTime.now(), time: currentTime,));
      await DbHelper.createDrink(DrinksModel(
        qty: liter,
        date: DateTime.now(),
        time: currentTime,
      ));
      alreadyDrank.value = totalDrink.value / targetDrink.value;
      refresh();
      println(">>>>>>>>> ${alreadyDrank.value} $currentTime");
      println(drinkList);
    } catch (e) {
      throw Exception(e);
    }
  }

  setLimit(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctc) {
          return const AlertDialog();
        });
  }

  Future<void> dismiss(int index, BuildContext context) async {
    ScaffoldMessenger.of(context).clearSnackBars();
    var id = drinkList[index].id;
    var drink = drinkList[index];
    println(id);
    totalDrink.value -= drinkList[index].qty!;
    await DbHelper.deleteDrink(id!);
    refresh();
    // Ask for Undo
    ScaffoldMessenger.of(context).clearSnackBars();
    // show undo message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text("Drink Removed"),
      // action: SnackBarAction(
      //   textColor: Colors.white,
      //   label: "Undo",
      //   onPressed: () async {
      //     await DbHelper.createDrink(drink);
      //     refresh();
      //   },
      // ),
    ));
  }

  drinkUpdate(DrinksModel drink) {
    println("Check ${drink.id}");
  }

  void updateDialog(BuildContext context, DrinksModel value) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext ctc, StateSetter setState) {
              return Container(
                padding: EdgeInsets.all(20),
                width: Get.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Update Drink",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Get.width * 0.05),
                    ),
                    UserInput(
                      label: 'Drink',
                      hint: 'eg : 500 ml',
                      suffixText: "ml",
                      controller: updateDrinkCon,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                    ),
                    UserInput(
                      label: 'Time',
                      hint: '09:05',
                      controller: drinkTimeCon,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      icon: Icons.date_range,
                      onTapIcon: (){},
                    ),

                  ],
                ),
              );
            },
          );
        });
  }


  timePicker(BuildContext context) {
    Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat:true,
        value: _time,
        sunrise: TimeOfDay(hour: 6, minute: 0),
        // optional
        sunset: TimeOfDay(hour: 18, minute: 0),
        // optional
        duskSpanInMinutes: 120,
        // optional
        onChange: (time){},
      ),
    );
  }
}
