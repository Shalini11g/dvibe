

import 'dart:convert';

import 'package:bill_splitter/model/sharedBill.dart';
import 'package:bill_splitter/model/sharedBillParticipant.dart';
import 'package:bill_splitter/model/transaction.dart';
import 'package:bill_splitter/model/user.dart';
import 'package:bill_splitter/viewModel/checkPhoneNumber.dart';
import 'package:bill_splitter/viewModel/contact_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_phone_number/get_phone_number.dart';
import 'package:http/http.dart' as http;

import '../model/api.dart';
import '../model/bill.dart';

class FirebaseDatabase{
  Api _api = new Api();
  //create new transaction
  Future<bool> sendMoney(Transaction transaction) async {
    try{
      String phoneNumber = await GetPhoneNumber().get();
      debugPrint('getPhoneNumber result: $phoneNumber');
      transaction.from!.phoneNumber = phoneNumber;
      transaction.to!.phoneNumber = PhoneChecker().formatPhoneNumber(transaction.to!.phoneNumber);
      transaction.id = await _api.getTransactionId();
      debugPrint("transaction id "+transaction.id.toString());
      final http.Response response = await _api.createNewTransaction(transaction,"users/"+transaction.to!.phoneNumber+"/transactions.json"); //add transaction in contact transaction list
      final http.Response response2 = await _api.updateCountTransaction(transaction.id+1);
      final http.Response response3 = await _api.createNewTransaction(transaction,"users/"+transaction.from!.phoneNumber+"/transactions.json");//add transaction in history
      return response2.statusCode == 200 && response.statusCode == 200 && response3.statusCode == 200;
    } catch(e){
      return false;
    }
  }
  //create new bill
  Future<bool> sendBill(Bill bill) async {
    try{
      String phoneNumber = await GetPhoneNumber().get();
      bill.id = await _api.getBillId();
      print(bill.id);
      bill.from!.phoneNumber = phoneNumber;
      bill.to!.phoneNumber = PhoneChecker().formatPhoneNumber(bill.to!.phoneNumber);
      print(bill.from!.phoneNumber);
      final http.Response response = await _api.putBill(bill, "users/"+bill.to!.phoneNumber+"/bills.json");
      if(!bill.isSharedBill()){
        final http.Response response2 = await _api.putBill(bill, "users/"+bill.from!.phoneNumber+"/bills.json");
      }
      final http.Response response3 = await _api.updateCountBill(bill.id+1);
      return response.statusCode == 200 && response3.statusCode == 200;
      //response2.statusCode == 200 &&
    } catch(e){
      return false;
    }
  }
  //create new shared bill
  Future<bool> sendSharedBill(SharedBill sharedBill) async {
    try{
      String phoneNumber = await GetPhoneNumber().get();
      sharedBill.from!.phoneNumber = phoneNumber;
      sharedBill.id = await _api.getSharedBillId();
      var response = await _api.putSharedBill(sharedBill);
      var response2 = await _api.updateCountSharedBill(sharedBill.id+1);
      bool isSend = true;
      await Future.forEach(sharedBill.to!, (participant) async {
        Bill bill = Bill(sharedBill.from!,participant.user!,participant.amount,sharedBill.comment,DateTime.now(),participant.hasPay);
        bill.sharedBill = sharedBill;
        bool isOk = await sendBill(bill);
        print(isOk.toString());
        isSend = isSend && isOk;
      });
      return isSend && response.statusCode == 200 && response2.statusCode == 200;
    } catch(e){
      return false;
    }
  }
  //send money + update some data
  Future<bool> payBill(Bill bill) async{
    try{
      String phoneNumber = await GetPhoneNumber().get();
      Transaction transaction = Transaction(bill.from!, bill.to!, bill.amount, "reimbursement", DateTime.now());
      sendMoney(transaction);
      bill.isPay = true;
      var response = await _api.putBill(bill, "users/"+PhoneChecker().formatPhoneNumber(bill.to!.phoneNumber)+"/bills.json");
      bool sharedBillIsOk = true;
      if(bill.isSharedBill()){
        var response2 = await _api.paySharedBill(bill.sharedBill!.id, phoneNumber);
        sharedBillIsOk  = (response2.statusCode == 200);
      }
      return sharedBillIsOk && response.statusCode == 200;
    } catch(e){
      return false;
    }
  }

  // get all transaction for the current user
  Future<List<Transaction>> getTransactions() async {
    String phoneNumber = await GetPhoneNumber().get();
    List<Transaction> transactions = [];
/*
    DateTime date = DateTime.now();
    transactions.add(Transaction(UserApp("Alex","+336 57 45 10 20"), UserApp("Bernard","+447 45 45 14 10"), 150, "Thank you", date));
    transactions.add(Transaction(UserApp("Akash","+336 45 11 01 20"), UserApp("Maurice","+447 86 54 24 75"), 50, "For the restaurant", date));
    transactions.add(Transaction(UserApp("Gauri","+336 78 54 40 12"), UserApp("Shalini","+447 54 21 80 21"), 15, "Thank you", date));
    transactions.add(Transaction(UserApp("Eric","+336 98 54 21 10"), UserApp("Quentin","+447 96 54 10 10"), 10.54, "Thk for help", date));
    transactions.add(Transaction(UserApp("Anne","+336 50 24 21 10"), UserApp("Macron","+447 97 54 22 10"), 20, "I have to reimburse you", date));
    transactions.add(Transaction(UserApp("Akash","+336 45 11 01 20"), UserApp("François","+447 97 54 24 10"), 12.5, "Thank you", date));

    transactions[1].bill = Bill(UserApp("Maurice","+447 86 54 24 75"), UserApp("Akash","+336 45 11 01 20"), 450, "Don't forget for the restaurant", date,true);
    transactions[2].bill = Bill(UserApp("Shalini","+447 54 21 80 21"), UserApp("Gauri","+336 78 54 40 12"), 450, "For something", date,true);

    List<SharedBillParticipant> participants = [];
    participants.add(SharedBillParticipant("Akash","+336 45 11 01 20",50,false));
    participants.add(SharedBillParticipant("Louise","+33754562145",51,false));
    participants.add(SharedBillParticipant("Bernard","+33654756757",52,true));
    transactions[1].bill?.sharedBill = SharedBill(UserApp("Maurice","+447 86 54 24 75"), participants, "Don't forget for the restaurant");
*/
    try{
      print(phoneNumber);
      transactions = await _api.fetchTransaction(phoneNumber);
      for(int i =0;i<transactions.length;i++){
        transactions[i].from!.name = await ContactTool().getContactName(transactions[i].from!.phoneNumber);
        transactions[i].to!.name = await ContactTool().getContactName(transactions[i].to!.phoneNumber);
      }
      return new List.from(transactions.reversed);
    }catch(e){
      print(e);
      return transactions;
    }
  }

  //fake api
  Future<List<Bill>> getBills() async {
    String phoneNumber = await GetPhoneNumber().get();
    List<Bill> bills = [];/*
    DateTime date = DateTime.now();
    bills.add(Bill(UserApp("Jean Francis","+45 876 575676"),UserApp("Donald","+5455754876"),540.10,"For the cafe",date,true));
    bills.add(Bill(UserApp("Alex","+5455754876"),UserApp("Jean Francis","+45 876 575676"),45,"",date,false));
    bills.add(Bill(UserApp("Bob","+5455754876"),UserApp("Jean Francis","+45 876 575676"),150,"For the party",date,false));
    bills.add(Bill(UserApp("Maxence","+45 876 575676"),UserApp("Donald","+5455754876"),150,"",date,true));
    bills.add(Bill(UserApp("Macron","+5455754876"),UserApp("Jean Francis","+45 876 575676"),101,"",date,true));
    bills.add(Bill(UserApp("Jean Francis","+45 876 575676"),UserApp("Pierre","+5455754876"),15,"For the restaurant",date,true));

    List<SharedBillParticipant> participants = [];
    participants.add(SharedBillParticipant("Akash","+336 45 11 01 20",50,false));
    participants.add(SharedBillParticipant("Louise","+33754562145",51,false));
    participants.add(SharedBillParticipant("Bernard","+33654756757",52,true));

    bills[0].sharedBill = SharedBill(UserApp("Macron","+5645675675765"), participants, "I need money");
*/  try{
      bills = await _api.fetchBills(phoneNumber);
      for(int i =0;i<bills.length;i++){
        bills[i].from!.name = await ContactTool().getContactName(bills[i].from!.phoneNumber);
        bills[i].to!.name = await ContactTool().getContactName(bills[i].to!.phoneNumber);
      }
      return new List.from(bills.reversed);
    }
    catch(e){
      print(e);
      return bills;
    }
  }

}