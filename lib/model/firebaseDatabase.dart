

import 'package:bill_splitter/model/sharedBill.dart';
import 'package:bill_splitter/model/sharedBillParticipant.dart';
import 'package:bill_splitter/model/transaction.dart';
import 'package:bill_splitter/model/user.dart';

import 'bill.dart';

class FirebaseDatabase{
  //create new transaction
  void sendMoney(Transaction transaction){

  }
  //create new bill
  void sendBill(Bill bill){

  }
  //create new shared bill
  void sendSharedBill(SharedBill sharedBill){

  }
  //fake api
  // get all transaction for the current user
  List<Transaction> getTransactions(){
    List<Transaction> transactions = [];
    DateTime date = DateTime.now();
    transactions.add(Transaction(UserApp("Alex","+336 57 45 10 20"), UserApp("Bernard","+447 45 45 14 10"), 150, "Thank you", date));
    transactions.add(Transaction(UserApp("Akash","+336 45 11 01 20"), UserApp("Maurice","+447 86 54 24 75"), 50, "For the restaurant", date));
    transactions.add(Transaction(UserApp("Gauri","+336 78 54 40 12"), UserApp("Shalini","+447 54 21 80 21"), 15, "Thank you", date));
    transactions.add(Transaction(UserApp("Eric","+336 98 54 21 10"), UserApp("Quentin","+447 96 54 10 10"), 10.54, "Thk for help", date));
    transactions.add(Transaction(UserApp("Anne","+336 50 24 21 10"), UserApp("Macron","+447 97 54 22 10"), 20, "I have to reimburse you", date));
    transactions.add(Transaction(UserApp("Maurice","+336 54 54 10 20"), UserApp("François","+447 97 54 24 10"), 12.5, "Thank you", date));
    
    transactions[1].bill = Bill(UserApp("Maurice","+447 86 54 24 75"), UserApp("Akash","+336 45 11 01 20"), 450, "Don't forget for the restaurant", date,true);
    transactions[2].bill = Bill(UserApp("Shalini","+447 54 21 80 21"), UserApp("Gauri","+336 78 54 40 12"), 450, "For something", date,true);

    List<SharedBillParticipant> participants = [];
    participants.add(SharedBillParticipant("Akash","+336 45 11 01 20",50,false));
    participants.add(SharedBillParticipant("Louise","+33754562145",51,false));
    participants.add(SharedBillParticipant("Bernard","+33654756757",52,true));
    transactions[1].bill?.sharedBill = SharedBill(UserApp("Maurice","+447 86 54 24 75"), participants, "Don't forget for the restaurant");

    return transactions;
  }
  //fake api, usefull for notification
  // get all new transaction for the current user
  // When a user do a transaction, the transaction is haded to a newTransactionList
  // That allow us to push new notification when we see a new transaction
  // When the user is aware that a new transaction is done, this transaction is remove from the newTransactionList and add to the personnal transaction history
  List<Transaction> getNewTransactions(){
    List<Transaction> transactions = [];
    return transactions;
  }
  
  //fake api
 List<Bill> getBills(){
    List<Bill> bills = [];
    DateTime date = DateTime.now();
    bills.add(Bill(UserApp("Akash","+45 876 575676"),UserApp("Donald","+5455754876"),540.10,"For the cafe",date,true));
    bills.add(Bill(UserApp("Alex","+45 876 575676"),UserApp("Patric","+5455754876"),45,"",date,false));
    bills.add(Bill(UserApp("Bob","+45 876 575676"),UserApp("Lauris","+5455754876"),150,"For the party",date,false));
    bills.add(Bill(UserApp("Maxence","+45 876 575676"),UserApp("Donald","+5455754876"),150,"",date,true));
    bills.add(Bill(UserApp("Akash","+45 876 575676"),UserApp("Gauri","+5455754876"),101,"",date,true));
    bills.add(Bill(UserApp("Paul","+45 876 575676"),UserApp("Pierre","+5455754876"),15,"For the restaurant",date,true));

    List<SharedBillParticipant> participants = [];
    participants.add(SharedBillParticipant("Akash","+336 45 11 01 20",50,false));
    participants.add(SharedBillParticipant("Louise","+33754562145",51,false));
    participants.add(SharedBillParticipant("Bernard","+33654756757",52,true));

    bills[0].sharedBill = SharedBill(UserApp("Macron","+5645675675765"), participants, "I need money");

    return bills;
 }
}