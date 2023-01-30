import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/bill.dart';
import '../model/transaction.dart';
import '../viewModel/strNumber.dart';
// import '../viewModel/sm_strNumber_operation.dart';

class TransactionDetailPage extends StatelessWidget {
  Transaction? transaction;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Transaction Details"),
          backgroundColor: Colors.blue[400],
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.white,
            child: SizedBox(
              width: 300,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: const Icon(
                        Icons.done_all,
                        size: 150,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue[500],
                      radius: 108,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Transaction Successful',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      transaction!.from!.name,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      transaction!.from!.phoneNumber,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      strNumber().formatNumber(transaction!.amount.toString()),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _body() {
  //   return Column(
  //     children: [
  //       Text(transaction!.from!.name),
  //       Text(transaction!.from!.phoneNumber),
  //       Text(strNumber().formatNumber(transaction!.amount.toString()))
  //     ],
  //   );
  // }

  TransactionDetailPage(Transaction transaction) {
    this.transaction = transaction;
  }
}
