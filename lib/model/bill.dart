import 'package:bill_splitter/model/user.dart';
import 'package:bill_splitter/model/sharedBill.dart';

class Bill{
  User? from;
  User? to;
  double amount = 0;
  String comment = "";
  DateTime? dateOfCreation;
  SharedBill? sharedBill;

  Bill(User from, User to, double amount, String comment, DateTime dateOfCreation){
    this.from = from;
    this.to = to;
    this. amount = amount;
    this.comment = comment;
    this.dateOfCreation = dateOfCreation;
  }

  bool isSharedBill(){
    return this.sharedBill != null;
  }
}