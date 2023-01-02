import 'package:bill_splitter/model/user.dart';
import 'package:bill_splitter/model/sharedBill.dart';

//represent a bill
/*
this class contain a sharedBill, if sharedBill is null that mean
this is a simple bill. Else, this bill is part of a sharedBill.
the method isSharedBill() help

 */
class Bill{
  UserApp? from;
  UserApp? to;
  double amount = 0;
  String comment = "";
  bool isPay = false;
  int id = 0;
  DateTime? dateOfCreation;
  SharedBill? sharedBill;

  Bill(UserApp from, UserApp to, double amount, String comment, DateTime dateOfCreation, bool isPay){
    this.from = from;
    this.to = to;
    this. amount = amount;
    this.comment = comment;
    this.dateOfCreation = dateOfCreation;
    this.isPay = isPay;
  }

  bool isSharedBill(){
    return this.sharedBill != null;
  }
}