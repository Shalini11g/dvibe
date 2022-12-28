/*
View to send money
User need to put an amount of money and can add some comment
 */

import 'package:bill_splitter/viewModel/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

//Work in progress

class SendMoneyAmountComment extends StatelessWidget{
  Contact _contact = new Contact();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Send money"),),
        body: _body(),
      )
    );
  }

  Widget _body(){
    return Column(
      children: [
        ListContactState(null).profilePicture(this._contact, 100),
        Text(this._contact.displayName,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        Text(this._contact.phones.first.number, style: TextStyle(color: Colors.grey)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Amount:", style: TextStyle(fontSize: 20),),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            Text("Message:",style: TextStyle(fontSize: 20)),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Message"
              ),
            )
          ],
        ),
      ],
    );
  }

  SendMoneyAmountComment(Contact contact){
    this._contact = contact;
  }

}