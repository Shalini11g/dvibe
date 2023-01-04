import 'package:bill_splitter/view/ask_money_select_contact.dart';
import 'package:bill_splitter/view/shared_bill_select_contact.dart';
import 'package:bill_splitter/view/sm_select_contact_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChooseActionAfterPushThePlusButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(title: Text("What do you want to do?"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context!).push(
                  MaterialPageRoute(
                    builder: (BuildContext) {
                      return SendMoneySelectContact(context).view();
                    },
                  ),
                );
              }, child: Text("Send money")),
              ElevatedButton(onPressed: (){
                Navigator.of(context!).push(
                  MaterialPageRoute(
                    builder: (BuildContext) {
                      return AskMoneySelectContact(context).view();
                    },
                  ),
                );
              }, child: Text("Ask for money")),
              ElevatedButton(onPressed: (){
                Navigator.of(context!).push(
                  MaterialPageRoute(
                    builder: (BuildContext) {
                      return SharedBillSelectContact();
                    },
                  ),
                );
                }, child: Text("Split bill")),
            ],
          ),
        )
        )
    );
  }


}