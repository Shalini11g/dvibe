import 'package:bill_splitter/model/sharedBill.dart';
import 'package:bill_splitter/model/sharedBillParticipant.dart';
import 'package:bill_splitter/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  List<SharedBillParticipant> participants = [];
  participants.add(SharedBillParticipant("Arthur","+445675376572",150,false));
  participants.add(SharedBillParticipant("Louise","+33754562145",150,false));
  participants.add(SharedBillParticipant("Bernard","+33654756757",150,true));
  SharedBill sharedBill = new SharedBill(UserApp("Alex","+33545677"), participants, "comment");

  test("test total amount computation", (){
    expect(sharedBill.totalAmount(), 450);
  });
  test("test reimbursed amount computation", (){
    expect(sharedBill.totalReimbursed(), 150);
  });
}