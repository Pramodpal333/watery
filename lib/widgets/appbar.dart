import 'package:flutter/material.dart';
import 'package:watery/utils/colors.dart';

AppBar customAppbar(
  BuildContext context, {
  Widget? leading,
  bool? showLeading,
  required String title,
}) {
  return AppBar(
    elevation: 0,
    title: Text(title),
    leading: Visibility(
        visible: showLeading ?? false,
        child: leading ??
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))),
    backgroundColor: kDarkBgColor,
  );
}
