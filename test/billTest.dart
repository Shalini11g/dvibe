import 'package:bill_splitter/model/bill.dart';
import 'package:bill_splitter/model/sharedBill.dart';
import 'package:bill_splitter/model/sharedBillParticipant.dart';
import 'package:bill_splitter/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  List<SharedBillParticipant> participants = [];
  participants.add(SharedBillParticipant("Arthur","+445675376572",150,false));
  participants.add(SharedBillParticipant("Louise","+33754562145",150,false));
  participants.add(SharedBillParticipant("Bernard","+33654756757",150,true));
  SharedBill sharedBill = new SharedBill(User("Alex","+33545677"), participants, "comment");
  DateTime date = DateTime.now();

  Bill normalBill = new Bill(User("Jean","+2454564537"),User("Alice","+5552757654"),452,"",date,false);
  Bill billShared = new Bill(User("Jean","+2454564537"),User("Alice","+5552757654"),452,"",date,true);
  billShared.sharedBill = sharedBill;

  test("this is a normal bill", (){
    expect(normalBill.isSharedBill(), false);
  });
  test("this is a shared bill", (){
    expect(billShared.isSharedBill(), true);
  });
}