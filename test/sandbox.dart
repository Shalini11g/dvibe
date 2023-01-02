
import 'dart:convert';

import 'package:bill_splitter/model/bill.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
import 'package:bill_splitter/model/transaction.dart';
import 'package:bill_splitter/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get_phone_number/get_phone_number.dart';


Future<void> main() async {
  FirebaseDatabase test = new FirebaseDatabase();

  //var response = await http.get(Uri.parse('https://d-vibe-default-rtdb.europe-west1.firebasedatabase.app/countTransaction.json'));
  //print(json.decode(response.body));
  DateTime date = DateTime.now();
  //Transaction transaction = new Transaction(UserApp("Alex","phone number"), UserApp("Jean","+5425454214"), 50, "comment", date);
  //print(await FirebaseDatabase().sendMoney(transaction));
  Bill bill = new Bill(UserApp("Bernard","phone number"),UserApp("Patrice","+5456457454754"),405.10,"hello world",date,false);
  print(await FirebaseDatabase().sendBill(bill));



}