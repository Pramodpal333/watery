import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watery/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.child, this.onTap, this.color}) : super(key: key);

  final Widget child;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: w,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:color ?? kDarkBgColor
        ),
          onPressed: onTap,
          child: child),
    );
  }
}
