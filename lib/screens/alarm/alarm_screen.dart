import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:watery/utils/colors.dart';
import 'package:watery/utils/custom_print.dart';
import 'package:watery/widgets/appbar.dart';
import 'package:watery/widgets/button.dart';
import 'package:watery/widgets/date_picker.dart';

class Alarm extends StatefulWidget {
  Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  Time _time = Time(hour: 11, minute: 30, second: 20);

  Time _endTime = Time(hour: 23, minute: 10, second: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "Alarm"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyDatePicker(
                  time: _time,
                  onChange: (time) {
                    println(">> $time");
                    println(">> ${time.hourOfPeriod}");
                    println(">> ${time.hour}");
                    setState(() {
                      _time = time;
                    });
                  },
                  timeText: 'Wake up at',
                )),
                // Spacer(),
                Expanded(
                    child: MyDatePicker(
                  time: _endTime,
                  onChange: (time) {
                    setState(() {
                      _endTime = time;
                    });
                  },
                  timeText: 'Sleep at',
                )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonWidget(
                color: Colors.white,
                child: Text(
                  "Notify Me",
                  style: TextStyle(color: kDarkBgColor),
                ),
                onTap: () {},
                splashColor: kDarkBgColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "Note :- you will be notified every hour between this time",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
