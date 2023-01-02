import 'package:bill_splitter/model/firebaseDatabase.dart';
import 'package:bill_splitter/view/billDetail.dart';
import 'package:flutter/material.dart';
import '../model/bill.dart';
import '../pay_bills.dart';
import '../viewModel/sm_strNumber_operation.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Bill> allBills = FirebaseDatabase().getBills();
    return ListView.builder(
      itemCount: allBills.length,
      itemBuilder: (context, i) => ListTile(
        title: _renderBill(allBills[i]),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext) {
                return BillDetailPage(allBills[i]);
                }
            )
          );
        },
      ),
    );
  }
  //quick and dirty
  Widget _renderBill(Bill bill){
    return Row(
      children: [
        Text(strNumber().formatNumber(bill.amount.toString())),
        Text(bill.from!.name),
        Text(bill.comment)
      ],
    );
  }
}
