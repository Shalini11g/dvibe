import 'package:bill_splitter/model/bill.dart';
import 'package:bill_splitter/model/user.dart';

// represent a transaction
// this transaction can be a simple transaction,
// a transaction to pay a bill
// or a transaction to pay a sharedBill
class Transaction{
  UserApp? from;
  UserApp? to;
  double amount=0;
  String comment = "";
  DateTime? dateOfTransaction;
  Bill? bill;

  Transaction(UserApp from, UserApp to,double amount, String comment,DateTime dateOfTransation){
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