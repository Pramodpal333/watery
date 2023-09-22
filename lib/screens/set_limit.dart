import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watery/controllers/set_limit/set_limit_controller.dart';
import 'package:watery/widgets/appbar.dart';
import 'package:watery/widgets/button.dart';
import 'package:watery/widgets/textfeild.dart';

class SetLimitScreen extends StatelessWidget {
  const SetLimitScreen({Key? key, this.showBack}) : super(key: key);
  final bool? showBack;

  @override
  Widget build(BuildContext context) {
    SetLimitController controller = Get.put(SetLimitController());
    var w = Get.width;
    return Scaffold(
      appBar: customAppbar(context, title: "Daily Limit",showLeading: showBack ?? true ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          width: w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Text(
                  "Set Daily Limit",
                  style: TextStyle(
                      fontSize: w * 0.07, fontWeight: FontWeight.w500),
                ),
              ),
              UserInput(
                label: 'Daily Limit',
                hint: 'eg : 500',
                controller: controller.limitCon,
                suffixText: "ml",
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
              ButtonWidget(
                child: Text("Save"),
                onTap: () {
                  controller.validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
