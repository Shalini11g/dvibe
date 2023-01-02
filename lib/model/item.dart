// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.amount,
    required this.contact,
    required this.id,
    required this.name,
    required this.paymentStatus,
    required this.remark,
    required this.time,
  });

  String amount;
  String contact;
  String id;
  String name;
  String paymentStatus;
  String remark;
  String time;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        amount: json["amount"],
        contact: json["contact"],
        id: json["id"],
        name: json["name"],
        paymentStatus: json["payment_status"],
        remark: json["remark"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "contact": contact,
        "id": id,
        "name": name,
        "payment_status": paymentStatus,
        "remark": remark,
        "time": time,
      };
}
