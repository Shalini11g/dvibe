/*
View to send money
User need to put an amount of money and can add some comment
 */

import 'package:bill_splitter/viewModel/generate_simple_contact_list.dart';
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
  var inputAmountOfMoneyToSend = TextEditingController();
  var inputCommentWithMoneySend = TextEditingController();
  String amount = "";
  String comment = "";
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
    inputAmountOfMoneyToSend.text = amount;
    inputCommentWithMoneySend.text = comment;
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
                  onEditingComplete: (){
                    amount = inputAmountOfMoneyToSend.text;
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                  },
                  controller: inputAmountOfMoneyToSend,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "in dollars \$", border: OutlineInputBorder()),
                ),
                SizedBox(height: 30),
                Text("Message:", style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                TextField(
                  onEditingComplete: (){
                    comment = inputCommentWithMoneySend.text;
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                  },
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

              onPressed:(isOk())?(){
                  debugPrint("Test passed");
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) {
                      return SendMoneyAskForConfirmation(
                          inputAmountOfMoneyToSend.text, this._contact,inputCommentWithMoneySend.text);
                    },
                  ));
                }
                :null,
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
  bool isOk(){
    return SendMoneyformController(inputAmountOfMoneyToSend.text,inputCommentWithMoneySend.text).isOk;
  }
}
