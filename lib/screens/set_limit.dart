import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watery/widgets/appbar.dart';
import 'package:watery/widgets/button.dart';
import 'package:watery/widgets/textfeild.dart';

class SetLimitScreen extends StatelessWidget {
  const SetLimitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    return Scaffold(
      appBar: customAppbar(context, title: ""),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          width: w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserInput(label: 'Daily Limit', hint: 'eg : 500', ),
              ButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
