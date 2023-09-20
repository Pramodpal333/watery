// To parse this JSON data, do
//
//     final drinksModel = drinksModelFromJson(jsonString);

import 'dart:convert';

DrinksModel drinksModelFromJson(String str) => DrinksModel.fromJson(json.decode(str));

String drinksModelToJson(DrinksModel data) => json.encode(data.toJson());

class DrinksModel {
  int? id;
  int? qty;
  DateTime? date;
  DateTime? createdAt;
  String? time;
  String? type;

  DrinksModel({
     this.id,
    this.qty,
    this.date,
    this.createdAt,
    this.time,
    this.type = "ml",
  });

  factory DrinksModel.fromJson(Map<String, dynamic> json) => DrinksModel(
    id: int.tryParse(json["id"].toString()),
    qty: json["qty"],
    date: DateTime.parse(json["date"].toString()),
    time: json["time"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"].toString())
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "qty": qty,
    "date": date,
    "time": time,
    "type": type,
    "createdAt": createdAt
  };
}
