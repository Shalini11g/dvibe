import 'package:bill_splitter/model/user.dart';

//represent the participant of a sharedBill
class SharedBillParticipant{
  double amount = 0;
  bool hasPay = false;
  UserApp? user;

  SharedBillParticipant(String name, String phoneNumber, double amount, bool hasPay){
    this.amount = amount;
    this.hasPay = hasPay;
    this.user = new UserApp(name, phoneNumber);
  }
  SharedBillParticipant.fromUser(UserApp user, double amount, bool hasPay){
    this.amount = amount;
    this.hasPay = hasPay;
    this.user = user;
  }
}