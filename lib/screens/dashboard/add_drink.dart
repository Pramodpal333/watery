import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDrinkDialog extends StatelessWidget {
  const AddDrinkDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Add Drinks"),
    );
  }
}
