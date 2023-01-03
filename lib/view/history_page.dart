import 'package:bill_splitter/view/history_detail.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
import 'package:flutter/material.dart';

import '../model/transaction.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Transaction>? _transactionsList;
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    FirebaseDatabase api = new FirebaseDatabase();
    final userTransactions = await api.getTransactions();
    setState(() => _transactionsList = userTransactions);
  }

  Widget build(BuildContext context) {
    if (_transactionsList == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: _transactionsList!.length,
      itemBuilder: (context, i) => ListTile(
        title: _renderOneTransaction(_transactionsList![i]),
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext) {
                    return TransactionDetailPage(_transactionsList![i]);
                  }
              )
          );
        },
      ),
    );
  }
  Widget _renderOneTransaction(Transaction transaction){
    bool iWasSendingMoney = transaction.from!.phoneNumber == "+336 45 11 01 20";
    return Row(
      children: [
        sendOrReceive(iWasSendingMoney),
        Text(transaction.amount.toString()),
        Text(transaction.from!.name),
        Text(transaction.comment),
        Text(transaction.dateOfTransaction.toString().substring(0,10))
      ],
    );
  }
  Icon sendOrReceive(bool iWasSendingMoney){
    if(iWasSendingMoney){
      return Icon(Icons.call_made,color: Colors.deepOrange,);
    }
    return Icon(Icons.call_received, color: Colors.green,);
  }
}
