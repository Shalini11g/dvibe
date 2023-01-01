import 'package:bill_splitter/model/bill.dart';
import 'package:bill_splitter/model/sharedBill.dart';
import 'package:bill_splitter/model/transaction.dart';
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

  Bill normalBill = new Bill(User("Jean","+2454564537"),User("Alice","+5552757654"),452,"",date);
  Bill billShared = new Bill(User("Jean","+2454564537"),User("Alice","+5552757654"),452,"",date);;
  billShared.sharedBill = sharedBill;

  Transaction simpleTransaction = Transaction(User("Michel","+65787545"), User("Albert","+564567576"), 410, "comment", date);
  Transaction payBillTransaction = Transaction(User("Michel","+65787545"), User("Albert","+564567576"), 410, "comment", date);
  Transaction paySharedBillTransaction = Transaction(User("Michel","+65787545"), User("Albert","+564567576"), 410, "comment", date);

  payBillTransaction.bill = normalBill;
  paySharedBillTransaction.bill = billShared;

  test("this is a normal transaction", (){
    expect(simpleTransaction.toPaySimpleBill(), false);
    expect(simpleTransaction.toPaySharedBill(), false);
  });
  test("this transaction pay a bill", (){
    expect(payBillTransaction.toPaySimpleBill(), true);
    expect(payBillTransaction.toPaySharedBill(), false);
  });
  test("this transaction pay a shared bill", (){
    expect(paySharedBillTransaction.toPaySimpleBill(), false);
    expect(paySharedBillTransaction.toPaySharedBill(), true);
  });
}