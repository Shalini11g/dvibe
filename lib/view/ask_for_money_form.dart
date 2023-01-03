import 'package:bill_splitter/view/ask_money_confirmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../viewModel/generate_simple_contact_list.dart';
import '../viewModel/sm_amount_comment_vm.dart';

class AskForMoneyForm extends StatefulWidget{
  Contact? contact;
  @override
  State<StatefulWidget> createState() {
    return AskForMoneyFormState(contact!);
  }
  AskForMoneyForm(Contact contact){
    this.contact = contact;
  }
}

class AskForMoneyFormState extends State<AskForMoneyForm>{
  Contact _contact = new Contact();
  TextEditingController inputAmountOfMoneyToSend = TextEditingController();
  TextEditingController inputCommentWithMoneySend = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Ask money"),),
          body: SingleChildScrollView(
            child: _body(),
          ),
        )
    );
  }

  Widget _body(){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 20),
            ListContactState().profilePicture(this._contact, 100),
            SizedBox(height: 10),
            Text(this._contact.displayName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text(this._contact.phones.first.number, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount:", style: TextStyle(fontSize: 20),),
                SizedBox(height: 10),
                TextFormField(
                  controller: inputAmountOfMoneyToSend,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "in dollars \$",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 30),
                Text("Message:",style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                TextField(
                  controller: inputCommentWithMoneySend,
                  keyboardType: TextInputType.multiline,
                  maxLength: 512,
                  maxLines: 5,
                  minLines: 5,
                  decoration: const InputDecoration(
                      hintText: "Thank you for helping!",
                      border: OutlineInputBorder()
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: (){
                SendMoneyformController testForm = SendMoneyformController(
                    inputAmountOfMoneyToSend.text,
                    inputCommentWithMoneySend.text);
                if (testForm.isOk) {
                  debugPrint("Test passed");
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) {
                      return AskMoneyAskForConfirmation(
                          inputAmountOfMoneyToSend.text, this._contact,inputCommentWithMoneySend.text);
                    },
                  ));
                } else {
                  debugPrint("Invalid value");
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: const Text('Macron explosion')));
                }
              },
              child: const Text("Ask money"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  AskForMoneyFormState(Contact contact){
    this._contact = contact;
  }

}