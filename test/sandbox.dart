
import 'dart:convert';

import 'package:bill_splitter/model/firebaseDatabase.dart';
import 'package:bill_splitter/model/transaction.dart';
import 'package:bill_splitter/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get_phone_number/get_phone_number.dart';


Future<void> main() async {
  FirebaseDatabase test = new FirebaseDatabase();

  //var response = await http.get(Uri.parse('https://d-vibe-default-rtdb.europe-west1.firebasedatabase.app/countTransaction.json'));
  //print(json.decode(response.body));
  DateTime date = DateTime.now();
  Transaction transaction = new Transaction(UserApp("Alex","phone number"), UserApp("Jean","+5425454214"), 50, "comment", date);
  print(await FirebaseDatabase().sendMoney(transaction));
  //print(response.statusCode);
  //print(transaction.dateOfTransaction!.millisecondsSinceEpoch);



}