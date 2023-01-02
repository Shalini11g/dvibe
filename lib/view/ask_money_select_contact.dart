import 'package:flutter/cupertino.dart';
import 'package:bill_splitter/viewModel/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'ask_for_money_form.dart';
/*
This class use ListContact with a custom function.
When the user has select a contact, this class open SendMoneyAmountComment
with the selected contact
 */
class AskMoneySelectContact{
  BuildContext? context;

  //generate the list of contact
  ListContact view(){
    return ListContact(_switchToAskForMoneyForm);
  }
  //the custom function
  _switchToAskForMoneyForm(Contact contact){
    Navigator.of(context!).push(
      MaterialPageRoute(
        builder: (BuildContext) {
          return AskForMoneyForm(contact);
        },
      ),
    );
  }
  //we need the context to open a new view
  AskMoneySelectContact(BuildContext context){
    this.context = context;
  }
}