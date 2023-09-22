import 'package:flutter/material.dart';
import 'package:watery/utils/colors.dart';
import 'package:get/get.dart';

AppBar customAppbar(
  BuildContext context, {
  bool? showLeading,
  bool? titleCenter,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0,
    centerTitle: titleCenter ?? false,
    title: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18),),
    leading: Visibility(
        visible: showLeading ?? true,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){Get.back();},
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Icon(Icons.arrow_back_ios),
          ),
        )),
    backgroundColor: kDarkerBgColor,
    actions: actions,
  );
}
