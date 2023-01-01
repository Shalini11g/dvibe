import 'package:bill_splitter/model/bill.dart';
import 'package:bill_splitter/model/user.dart';

class Transaction{
  User? from;
  User? to;
  double amount=0;
  String comment = "";
  DateTime? dateOfTransaction;
  Bill? bill;

  Transaction(User from, User to,double amount, String comment,DateTime dateOfTransation){
    this.from = from;
    this.to = to;
    this.amount = amount;
    this.comment = comment;
    this.dateOfTransaction = dateOfTransaction;
  }

  bool toPaySimpleBill(){
    return (this.bill != null)&& (this.bill?.sharedBill == null);
  }
  bool toPaySharedBill(){
    return (this.bill != null)&& (this.bill?.sharedBill != null);
  }
}