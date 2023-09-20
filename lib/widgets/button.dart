import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: w,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

        ),
          onPressed: () {},
          child: Text("Button")),
    );
  }
}
