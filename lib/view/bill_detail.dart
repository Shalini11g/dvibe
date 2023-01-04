import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/bill.dart';
import '../viewModel/strNumber.dart';

class BillDetailPage extends StatelessWidget{
  Bill? bill;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bill"),),
        body: _body(),
      ),
    );
  }

  Widget _body(){
    return Column(
      children: [
        Text(bill!.from!.name),
        Text(bill!.from!.phoneNumber),
        Text(strNumber().formatNumber(bill!.amount.toString()))

      ],
    );
  }

  BillDetailPage(Bill bill){
    this.bill = bill;
  }
}