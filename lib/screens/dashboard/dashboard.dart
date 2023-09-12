import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:watery/controllers/dashboard_controller.dart';
import 'package:watery/screens/dashboard/add_drink.dart';
import 'package:watery/screens/dashboard/drinks_list.dart';
import 'package:watery/utils/colors.dart';
import 'package:watery/utils/images.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({Key? key}) : super(key: key);

  final DashboardController dashboardCon = Get.put(DashboardController());
  final _key = GlobalKey<ExpandableFabState>();


  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: floatingButton(context),
      body: SizedBox(
        width: w,
        height: h,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Top App bar
            Container(
              margin: EdgeInsets.only(top: statusBar+15,left: 20,right: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello Pramod",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                  ),),
                  InkWell(
                    borderRadius: BorderRadius.circular(500),
                    onTap: (){},
                    child: Container(
                      margin:const EdgeInsets.all(5),
                      padding:const  EdgeInsets.symmetric(vertical: 8,horizontal: 9),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Image.asset(analytics_icon),
                    ),
                  )
                ],
              ),
            ),
            /// Circle Progress
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: kDarkBgColor,
                  borderRadius: BorderRadius.circular(500),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: Offset(0.0, 25.0))
                  ]),
              child: LiquidCircularProgressIndicator(
                value: 0.25,
                // Defaults to 0.5.
                valueColor: const AlwaysStoppedAnimation(kWaterColor),
                // Defaults to the current Theme's accentColor.
                backgroundColor: kDarkBgColor,
                // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.white,
                borderWidth: 1.0,
                direction: Axis.vertical,
                // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("1250 ml ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25),),
                    const Text("Daily Goal : 3500 ml",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),
                  ],
                ),
              ),
            ),
            /// Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(400)),
                  ),
                    onPressed: (){},
                    child:const Text("Set Daily Limit",style: TextStyle(color: kDarkBgColor),)),
                const SizedBox(width: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(400))
                  ),
                    onPressed: (){},
                    child:const Text("Alarm Setting",style: TextStyle(color: kDarkBgColor),)),
              ],
            ),

            ///Get List of Transactions
            Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: transactionTitle()
            ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10,bottom: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DrinksList(),
            ),
          )
          ],
        ),
      ),
    );
  }



  Widget transactionTitle(){
    return const  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Water',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
        Text('Time',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),),
      ],
    );
  }

  /// Floating Add Button
  floatingButton(BuildContext context) {
    return  ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: kDarkBgColor,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: kDarkBgColor,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
      overlayStyle: ExpandableFabOverlayStyle(color: Colors.black38),
      type: ExpandableFabType.up,
        distance: 70,
        key: _key,
        children: [
      FloatingActionButton.extended(
        backgroundColor: Colors.white,
        heroTag: null,
        onPressed: () {}, icon: Image.asset(smalllassIcon,height: 20,),
        label: Text("150 ml",style: TextStyle(color: kDarkBgColor),),
      ),
      FloatingActionButton.extended(
        backgroundColor: Colors.white,
        heroTag: null,
        onPressed: () {}, icon: Image.asset(bigGlassIcon,height: 30,),
        label: Text("250 ml",style: TextStyle(color: kDarkBgColor)),
      ),
      FloatingActionButton.extended(
        backgroundColor: Colors.white,
        heroTag: null,
        onPressed: () {}, icon: Image.asset(bottleIcon,height: 30,),
        label: Text("500 ml",style: TextStyle(color: kDarkBgColor)),
      ),
      FloatingActionButton.extended(
        backgroundColor: Colors.white,
        heroTag: null,
        onPressed: () {}, icon: Icon(Icons.add,color: kDarkBgColor,),
        label: Text("Custom",style: TextStyle(color: kDarkBgColor)),
      ),
    ]);
  }
}
