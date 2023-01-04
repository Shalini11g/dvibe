import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/bill.dart';
import '../model/transaction.dart';
import '../viewModel/strNumber.dart';

class TransactionDetailPage extends StatelessWidget{
  Transaction? transaction;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Transaction"),),
        body: _body(),
      ),
    );
  }

  Widget _body(){
    return Column(
      children: [
        Text(transaction!.from!.name),
        Text(transaction!.from!.phoneNumber),
        Text(strNumber().formatNumber(transaction!.amount.toString()))

      ],
    );
  }

  TransactionDetailPage(Transaction transaction){
    this.transaction = transaction;
  }
}