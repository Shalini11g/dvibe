import 'dart:convert';

import 'package:bill_splitter/model/transaction.dart';
import 'package:http/http.dart' as http;

import 'bill.dart';

class Api{
  String firebaseUrl = "https://d-vibe-default-rtdb.europe-west1.firebasedatabase.app/";

  Future<int> getTransactionId() async {
    var response = await http.get(Uri.parse('https://d-vibe-default-rtdb.europe-west1.firebasedatabase.app/countTransaction.json'));
    return json.decode(response.body);
  }
  Future<http.Response> createNewTransaction(Transaction transaction, String URL) async {
    // first, we get the bill id
    // but, because bill can be null, we need to check if bill exist
    int billId = -1; //-1 mean that bill is null
    if(transaction.bill != null){
      billId = transaction.bill!.id;
    }
    //then we send a request
    final http.Response response = await http.patch(
      Uri.parse(this.firebaseUrl+URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        transaction.id.toString(): {
          'amount': transaction.amount,
          'billId': billId,
          'comment': transaction.comment,
          'from': transaction.from!.phoneNumber,
          'to': transaction.to!.phoneNumber,
          'timestamp': transaction.dateOfTransaction!.millisecondsSinceEpoch
        }
      }),
    );
    return response;
  }
  Future<http.Response> updateCountTransaction(int newCount) async {
    final http.Response response = await http.patch(
      Uri.parse(this.firebaseUrl+".json"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "countTransaction":newCount
      }),
    );
    return response;
  }
  Future<int> getBillId() async {
    var response = await http.get(Uri.parse('https://d-vibe-default-rtdb.europe-west1.firebasedatabase.app/countBill.json'));
    return json.decode(response.body);
  }
  Future<http.Response> updateCountBill(int newCount) async {
    final http.Response response = await http.patch(
      Uri.parse(this.firebaseUrl+".json"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "countBill":newCount
      }),
    );
    return response;
  }
  Future<http.Response> createNewBill(Bill bill, String URL) async {

    //then we send a request
    final http.Response response = await http.patch(
      Uri.parse(this.firebaseUrl+URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        bill.id.toString(): {
          'from':bill.from!.phoneNumber,
          'to':bill.to!.phoneNumber,
          'amount':bill.amount,
          'comment':bill.comment,
          'timestamp':bill.dateOfCreation!.millisecondsSinceEpoch,
          'sharedbillid':-1
        }
      }),
    );
    return response;
  }
}