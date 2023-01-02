import 'package:bill_splitter/model/user.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
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
    String fromOrTo = "from";
    UserApp other = bill.from!;
    bool iMustSendMoney = "+45 876 575676" != bill.from!.phoneNumber;
    if(!iMustSendMoney){
      fromOrTo = "to";
      other = bill.to!;
    }
    String comment = bill.comment;
    if(bill.comment.length>30){
      comment = comment.substring(0,30);
    }else if(bill.comment.length == 0){
      comment = "...";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            sendOrreceive(iMustSendMoney),
            SizedBox(width: 10),
            Text(strNumber().formatNumber(bill.amount.toString()),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color.fromARGB(255, 75, 75, 75))),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(fromOrTo,style: TextStyle(fontSize: 20)),
                    SizedBox(width: 10),
                    Text(other.name,style: TextStyle(fontSize: 20)),
                  ],
                ),
                Text(comment,style: TextStyle(color: Colors.grey))
              ],
            ),
          ],
        ),
        Text(bill.dateOfCreation!.toString().substring(0,10))
      ],
    );
  }
  Icon sendOrreceive(bool iMustSendMoney){
    if(iMustSendMoney){
      return Icon(Icons.arrow_back,color: Colors.red,);
    }
    return Icon(Icons.arrow_forward, color: Colors.green,);
  }

}
