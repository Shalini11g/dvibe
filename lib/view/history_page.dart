import 'package:bill_splitter/view/history_detail.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
import 'package:flutter/material.dart';
import 'package:get_phone_number/get_phone_number.dart';

import '../model/transaction.dart';
import '../model/user.dart';
import '../viewModel/checkPhoneNumber.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Transaction>? _transactionsList;
  String phoneNumber = "";
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    phoneNumber = await GetPhoneNumber().get();
    phoneNumber = PhoneChecker().formatPhoneNumber(phoneNumber);
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
  Widget _renderOneTransaction(Transaction transaction) {
    bool iMustSendMoney = phoneNumber == PhoneChecker().formatPhoneNumber(transaction.from!.phoneNumber);
    UserApp other = transaction.from!;
    if (iMustSendMoney) {
      other = transaction.to!;
    }
    String comment = transaction.comment;
    if (transaction.comment.length > 30) {
      comment = comment.substring(0, 30);
    } else if (transaction.comment.length == 0) {
      comment = "...";
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: sendOrReceive(iMustSendMoney),
            title: Text(other.name),
            subtitle: Text(comment),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
              Text(transaction.dateOfTransaction.toString().substring(0,10)),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
  Icon sendOrReceive(bool iWasSendingMoney){
    if(iWasSendingMoney){
      return Icon(Icons.call_made,color: Colors.deepOrange,);
    }
    return Icon(Icons.call_received, color: Colors.green,);
  }
}
