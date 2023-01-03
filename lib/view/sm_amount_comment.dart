/*
View to send money
User need to put an amount of money and can add some comment
 */

import 'package:bill_splitter/viewModel/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:bill_splitter/viewModel/sm_amount_comment_vm.dart';
import 'package:bill_splitter/view/sm_ask_for_confirmation.dart';
//Work in progress

class SendMoneyAmountComment extends StatefulWidget {
  Contact _contact = new Contact();

  @override
  State<StatefulWidget> createState() {
    return SendMoneyAmountCommentState(this._contact);
  }

  SendMoneyAmountComment(Contact contact) {
    this._contact = contact;
  }
}

class SendMoneyAmountCommentState extends State<SendMoneyAmountComment> {
  Contact _contact = new Contact();
  TextEditingController inputAmountOfMoneyToSend = TextEditingController();
  TextEditingController inputCommentWithMoneySend = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Send money"),
      ),
      body: SingleChildScrollView(
        child: _body(),
      ),
    ));
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 20),
            ListContactState().profilePicture(this._contact, 100),
            SizedBox(height: 10),
            Text(
              this._contact.displayName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(this._contact.phones.first.number,
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amount:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: inputAmountOfMoneyToSend,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "in dollars \$", border: OutlineInputBorder()),
                ),
                SizedBox(height: 30),
                Text("Message:", style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                TextField(
                  controller: inputCommentWithMoneySend,
                  keyboardType: TextInputType.multiline,
                  maxLength: 512,
                  maxLines: 5,
                  minLines: 5,
                  decoration: const InputDecoration(
                      hintText: "Thank you for helping!",
                      border: OutlineInputBorder()),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                SendMoneyformController testForm = SendMoneyformController(
                    inputAmountOfMoneyToSend.text,
                    inputCommentWithMoneySend.text);
                if (testForm.isOk) {
                  debugPrint("Test passed");
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) {
                      return SendMoneyAskForConfirmation(
                          inputAmountOfMoneyToSend.text, this._contact,inputCommentWithMoneySend.text);
                    },
                  ));
                } else {
                  debugPrint("Invalid value");
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: const Text('Macron explosion')));
                }
              },
              child: const Text("Send money"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  SendMoneyAmountCommentState(Contact contact) {
    this._contact = contact;
  }
}
