import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bill_splitter/model/item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Item> transactionsList = [];
  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var records =
        await FirebaseFirestore.instance.collection('transactions').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => Item(
            amount: item['amount'],
            contact: item['contact'],
            id: item.id,
            name: item['name'],
            paymentStatus: item['payment_status'],
            remark: item['remark'],
            time: item['time'],
          ),
        )
        .toList();

    setState(() {
      transactionsList = _list;
    });
  }

  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: transactionsList.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         title: Text(transactionsList[index].name),
    //         subtitle: Text(transactionsList[index].amount),
    //       );
    //     },
    //   ),
    // );

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.black, // Set border color
              width: 3.0), // Set border width
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
          ] // Make rounded corner of border
          ),
      child: ListView.builder(
        itemCount: transactionsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(transactionsList[index].name),
            subtitle: Text(transactionsList[index].amount),
          );
        },
      ),
    );
  }
}
