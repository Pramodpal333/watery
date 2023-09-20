import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watery/utils/colors.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key, required this.label, required this.hint,  this.showLabel, this.prefix,}) : super(key: key);

  final String label;
  final String hint;
  final bool? showLabel;
  final Widget? prefix;


  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,bottom: 5,top: 10),
            width: w,
            child: Text(label)),
        Container(
            width: w,
            height: 60,
            decoration: BoxDecoration(
                color: kLightGrey, borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: TextFormField(
                decoration:  InputDecoration(
                  suffixText: "ml",
                  icon: null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
              hintText: hint,
              border: InputBorder.none
                ),
              ),
            )),
      ],
    );
  }
}
