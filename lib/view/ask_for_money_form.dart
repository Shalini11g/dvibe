import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import '../viewModel/contact.dart';

class askForMoneyForm extends StatefulWidget{
  Contact? contact;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return askForMoneyFormState(contact!);
  }
  askForMoneyForm(Contact contact){
    this.contact = contact;
  }
}

class askForMoneyFormState extends State<askForMoneyForm>{
  Contact _contact = new Contact();
  TextEditingController inputAmountOfMoneyToSend = TextEditingController();
  TextEditingController inputCommentWithMoneySend = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Send money"),),
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
            ListContactState(null).profilePicture(this._contact, 100),
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

              },
              child: const Text("Ask money"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  askForMoneyFormState(Contact contact){
    this._contact = contact;
  }

}