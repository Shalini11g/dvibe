import 'package:bill_splitter/model/user.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
import 'package:bill_splitter/view/bill_detail.dart';
import 'package:flutter/material.dart';
import '../model/bill.dart';
import '../viewModel/strNumber.dart';

class BillsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BillsPageState();
  }
  const BillsPage({super.key});
}

class BillsPageState extends State<BillsPage>{
  @override
  List<Bill>? _billList;
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    FirebaseDatabase api = new FirebaseDatabase();
    final usersBill = await api.getBills();
    setState(() => _billList = usersBill);
  }

  Widget build(BuildContext context) {
    if (_billList == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: _billList!.length,
      itemBuilder: (context, i) => ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        title: _renderOneBill(_billList![i]),
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext) {
                    return BillDetailPage(_billList![i]);
                  }
              )
          );
        },
      ),
    );
  }
  Widget _renderOneBill(Bill bill){
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

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.file_copy),
            title: Text("bill.from!.phoneNumber"),
            subtitle: Text('Valhallavägen 8, 371 41 Karlskrona'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Pay Bill'),
                onPressed: null,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
  Icon sendOrReceive(bool iMustSendMoney){
    if(iMustSendMoney){
      return Icon(Icons.call_received,color: Colors.deepOrange,);
    }
    return Icon(Icons.call_made, color: Colors.green,);
  }

}
/*
class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Bill> allBills = FirebaseDatabase().getBills();
    return ListView.builder(
      itemCount: allBills.length,
      itemBuilder: (context, i) => ListTile(
        title: _renderOneBill(allBills[i]),
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
  Widget _renderOneBill(Bill bill){
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
            sendOrReceive(iMustSendMoney),
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
  Icon sendOrReceive(bool iMustSendMoney){
    if(iMustSendMoney){
      return Icon(Icons.arrow_back,color: Colors.red,);
    }
    return Icon(Icons.arrow_forward, color: Colors.green,);
  }

}



import 'package:bill_splitter/payment_page.dart';
import 'package:flutter/material.dart';

import '../pay_bills.dart';
// import 'pay_bills.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.hotel),
              title: Text('Galgamarken Indian Food'),
              subtitle: Text('Valhallavägen 8, 371 41 Karlskrona'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Pay Bill'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PayBillButtonPage()),
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
