import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watery/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.child, this.onTap, this.color, this.splashColor, this.borderColor}) : super(key: key);

  final Widget child;
  final Function()? onTap;
  final Color? color;
  final Color? borderColor;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: w,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(splashColor ?? Colors.white24),
          backgroundColor: MaterialStateProperty.all<Color>(color ?? kDarkBgColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!)
                )
            )
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor:color ?? kDarkBgColor,
        //       foregroundColor: splashColor ?? Colors.white24,
        // ),
          onPressed: onTap,
          child: child),
    );
  }
}
