
import 'dart:convert';

import 'package:bill_splitter/model/bill.dart';
import 'package:bill_splitter/model/sharedBill.dart';
import 'package:bill_splitter/model/sharedBillParticipant.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
import 'package:bill_splitter/model/transaction.dart';
import 'package:bill_splitter/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get_phone_number/get_phone_number.dart';


Future<void> main() async {
  FirebaseDatabase test = new FirebaseDatabase();

  List<SharedBillParticipant> participants = [];
  participants.add(SharedBillParticipant("Alex", "phone number", 24, false));
  participants.add(SharedBillParticipant("Jean", "565647537654", 24, true));
  SharedBill sharedBill = SharedBill(UserApp("Alex","phone number"), participants, "test shared bill");

  print(await test.sendSharedBill(sharedBill));


}