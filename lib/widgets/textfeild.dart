import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watery/utils/colors.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key,
    required this.label,
    required this.hint,
    this.showLabel,
    this.prefix,
    this.controller,
     this.suffixText, this.validator, this.keyboardType, this.maxLength,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool? showLabel;
  final Widget? prefix;
  final TextEditingController? controller;
  final String? suffixText;
  final String Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
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
                maxLength:maxLength ,
                keyboardType: keyboardType,
                validator: validator,
                controller: controller,
                decoration: InputDecoration(
                  counterText: "",
                    suffixText: suffixText,
                    icon: null,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    hintText: hint,
                    border: InputBorder.none),
              ),
            )),
      ],
    );
  }
}
