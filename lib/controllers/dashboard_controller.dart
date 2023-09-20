import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:watery/models/drinks_model.dart';
import 'package:watery/utils/custom_print.dart';
import 'package:watery/utils/db_helper.dart';

class DashboardController extends GetxController{

  var totalDrink = 0.obs;
  var targetDrink = 4000.obs;
  var alreadyDrank = 0.0.obs;
  // var drinkList = RxList<DrinksModel>();
  final RxList<DrinksModel> drinkList = <DrinksModel>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initTask();
  }

  initTask() async {
    try {
      var drinks = await DbHelper.getDrinks();
      println("drinks init $drinks");
      // Convert the List<Map<String, dynamic>> to RxList<DrinksModel>
      final convertedList = drinks.map((map) => DrinksModel.fromJson(map)).toList();
      drinkList.assignAll(convertedList);
    }catch(e){
      throw Exception(e);
    }
  }

  Future<void> refresh()async {
    var drinks = await DbHelper.getDrinks();
    final convertedList = drinks.map((map) => DrinksModel.fromJson(map)).toList();
    drinkList.assignAll(convertedList);
    var total = drinkList.fold(0, (int previousValue, DrinksModel drinksModel) {
      return previousValue + drinksModel.qty!;
    } );
    totalDrink.value = total;
    alreadyDrank.value = totalDrink.value / targetDrink.value;
    println("Refreshed $total");
  }

  // Function to add drinks to table
  addDrinkFun(int liter) async {
    try {
      totalDrink.value += liter;
      dynamic currentTime = DateFormat.Hm().format(DateTime.now());
      // dynamic currentDate = DateFormat.yMMMd().format(DateTime.now());
      // drinkList.add(
      //     DrinksModel(qty: liter, date: DateTime.now(), time: currentTime,));
      await DbHelper.createDrink(
          DrinksModel(qty: liter, date: DateTime.now(), time: currentTime,));
      alreadyDrank.value = totalDrink.value / targetDrink.value;
      refresh();
      println(">>>>>>>>> ${alreadyDrank.value} $currentTime");
      println(drinkList);
    }catch(e){
      throw Exception(e);
    }
  }

  setLimit(BuildContext context){
    showDialog(context: context, builder: (BuildContext ctc){
      return const AlertDialog(

      );
    });
  }

  Future<void> dismiss(int index) async {
    var id = drinkList[index].id;
    println(id);
    totalDrink.value -= drinkList[index].qty!;
    await DbHelper.deleteDrink(id!);
    refresh();
  }



}