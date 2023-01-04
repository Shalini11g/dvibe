import 'package:bill_splitter/view/success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/bill.dart';
import '../model/transaction.dart';
import '../model/user.dart';
import '../viewModel/firebaseDatabase.dart';
import 'dashboard_page.dart';
import 'fail_page.dart';

class PayBillConfirmationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PayBillConfirmationPageState(bill!);
  }
  Bill? bill;
  PayBillConfirmationPage(Bill bill){
    this.bill = bill;
  }

}
class PayBillConfirmationPageState extends State<PayBillConfirmationPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Pay Bill"),),
        body: _body(context),
      ),
    );
  }
  Widget _body(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.file_upload, size: 50,),
        SizedBox(height: 10),
        Text("You will transfer", style: TextStyle(fontSize: 20, color: Colors.black87),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.amountRealPart,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ,Column(
              children: [
                SizedBox(height: 5),
                Text(this.amountDecimalPart,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
              ],)],
        ),
        SizedBox(height: 5),
        Text("To", style: TextStyle(fontSize: 15,color: Colors.black87),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bill.from!.name, style: TextStyle(fontSize: 20),),
                Text(bill.from!.phoneNumber, style: TextStyle(fontSize: 15, color: Colors.grey),)],)
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return DashboardPage();
                  }), (r){
                    return false;
                  });
                },
                child: Text("Cancel")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () async {
                  FirebaseDatabase api = FirebaseDatabase();
                  Transaction transaction = Transaction(bill.to!, bill.from!, bill.amount, "Reimbursement", DateTime.now());
                  bool success = await api.sendMoney(transaction);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) {
                      if(success){
                        return SuccessPage("Your transfer is send");
                      }else{
                        return FailPage("Your transfer is failed\nCheck you network");
                      }
                    },
                  ));
                },
                child: Text("Confirm"))
          ],),
        SizedBox(height: 40),
      ],
    );
  }

  Bill bill = Bill(UserApp("",""),UserApp("",""),0,"",DateTime.now(),false);
  String amountRealPart = "";
  String amountDecimalPart = "";
  PayBillConfirmationPageState(Bill bill){
    this.bill = bill;
  }

}