import 'package:bill_splitter/model/transaction.dart';
import 'package:bill_splitter/view/fail_page.dart';
import 'package:bill_splitter/view/success_page.dart';
import 'package:bill_splitter/viewModel/firebaseDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:bill_splitter/viewModel/contact.dart';
import 'package:bill_splitter/viewModel/sm_strNumber_operation.dart';

import '../model/bill.dart';
import '../model/user.dart';
import 'dashboard_page.dart';

class AskMoneyAskForConfirmation extends StatelessWidget{
  String amountRealPart = "";
  String amountDecimalPart = "";
  String comment = "";
  double amount = 0;
  Contact? contact;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Ask money"),),
            body: _body(context)
        )
    );
  }

  Widget _body(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.file_download, size: 50,),
        SizedBox(height: 10),
        Text("You will ask", style: TextStyle(fontSize: 20, color: Colors.black87),),
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
            ListContactState().profilePicture(this.contact!, 50),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact!.displayName, style: TextStyle(fontSize: 20),),
                Text(contact!.phones.first.number, style: TextStyle(fontSize: 15, color: Colors.grey),)],)
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
                  Bill bill = Bill(UserApp("me","me"), UserApp("other",contact!.phones.first.number),amount,comment,DateTime.now(),false);
                  bool success = await api.sendBill(bill);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) {
                      if(success){
                        return SuccessPage("You successfully asking money");
                      }else{
                        return FailPage("Fail to ask money\nCheck your network");
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
  AskMoneyAskForConfirmation(String amount, Contact contact, String comment){
    this.comment = comment;
    this.contact = contact;
    //class who contain some logic use in this view
    strNumber formating = new strNumber(); //from viewModel/sm_strNumber_operation.dart
    amount = formating.cleanNumber(amount);
    this.amount = double.parse(amount);
    //look like "$1,"
    this.amountRealPart = formating.getRealPart(amount);
    //look like "00"
    this.amountDecimalPart = formating.getDecimalPart(amount);
    //If you concatenate this two string, you get "$1,00"
  }
}