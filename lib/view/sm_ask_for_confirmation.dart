import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:bill_splitter/viewModel/contact.dart';
import 'package:bill_splitter/viewModel/sm_strNumber_operation.dart';

class SendMoneyAskForConfirmation extends StatelessWidget{
  String amountRealPart = "";
  String amountDecimalPart = "";
  Contact? contact;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Send money"),),
          body: _body()
        )
    );
  }
  
  Widget _body(){
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
            ListContactState(print).profilePicture(this.contact!, 50),
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
                  debugPrint("Cancel");
                },
                child: Text("Cancel")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: (){
                  debugPrint("Confirm");
                },
                child: Text("Confirm"))
          ],),
          SizedBox(height: 40),
      ],
    );
  }
  SendMoneyAskForConfirmation(String amount, Contact contact){
    this.contact = contact;
    //class who contain some logic use in this view
    strNumber formating = new strNumber(); //from viewModel/sm_strNumber_operation.dart
    amount = formating.cleanNumber(amount);
    //look like "$1,"
    this.amountRealPart = formating.getRealPart(amount);
    //look like "00"
    this.amountDecimalPart = formating.getDecimalPart(amount);
    //If you concatenate this two string, you get "$1,00"
  }
}