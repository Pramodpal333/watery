// To parse this JSON data, do
//
//     final drinksModel = drinksModelFromJson(jsonString);

import 'dart:convert';

DrinksModel drinksModelFromJson(String str) => DrinksModel.fromJson(json.decode(str));

String drinksModelToJson(DrinksModel data) => json.encode(data.toJson());

class DrinksModel {
  int? qty;
  String? date;
  String? time;
  String? type;

  DrinksModel({
    this.qty,
    this.date,
    this.time,
    this.type,
  });

  factory DrinksModel.fromJson(Map<String, dynamic> json) => DrinksModel(
    qty: json["qty"],
    date: json["date"],
    time: json["time"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "qty": qty,
    "date": date,
    "time": time,
    "type": type,
  };
}
