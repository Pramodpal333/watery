import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

class MyDatePicker extends StatelessWidget {
  MyDatePicker(
      {Key? key,
      required this.time,
      required this.timeText,
      required this.onChange,
      this.is24Hour})
      : super(key: key);

  final Time time;
  final String timeText;
  Function(Time) onChange;
  final bool? is24Hour;

  @override
  Widget build(BuildContext context) {
    var w = Get.width;
    var h = Get.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            timePicker(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: time.hour  > 9  ?18 :25,vertical: 50),
            margin: EdgeInsets.all(5),
            // width: 200,
            // height: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 0.3,color: Colors.white),
                color: kDarkBgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(1, 1),
                      blurRadius: 50,
                      spreadRadius: 3)
                ]),
            child: is24Hour ?? false
                ? Text(
                    "${time.hourOfPeriod} : ${time.minute} ${time.period.name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.06,
                        fontWeight: FontWeight.w600),
                  )
                : Text(
                    "${time.hour} : ${time.minute}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: w * 0.06,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          timeText,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  timePicker(BuildContext context) {
    Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat: is24Hour ?? true,
        value: time,
        sunrise: TimeOfDay(hour: 6, minute: 0),
        // optional
        sunset: TimeOfDay(hour: 18, minute: 0),
        // optional
        duskSpanInMinutes: 120,
        // optional
        onChange: onChange,
      ),
    );
  }
}
