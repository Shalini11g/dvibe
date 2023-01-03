import 'package:flutter/cupertino.dart';
import 'package:bill_splitter/viewModel/generate_simple_contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:bill_splitter/view/sm_amount_comment.dart';

/*
This class use ListContact with a custom function.
When the user has select a contact, this class open SendMoneyAmountComment
with the selected contact
 */
class SendMoneySelectContact{
  BuildContext? context;

  //generate the list of contact
  ListContact view(){
    return ListContact(_switchToSendMoneyAmountCommentPage);
  }
  //the custom function
  _switchToSendMoneyAmountCommentPage(Contact contact){
    Navigator.of(this.context!).push(
      MaterialPageRoute(
        builder: (BuildContext) {
          return SendMoneyAmountComment(contact);
        },
      ),
    );
  }
  //we need the context to open a new view
  SendMoneySelectContact(BuildContext context){
    this.context = context;
  }
}