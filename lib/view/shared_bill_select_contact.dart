
import 'dart:typed_data';
import 'package:bill_splitter/view/shared_bill_form.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';

import '../viewModel/generate_simple_contact_list.dart';


class SharedBillSelectContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SharedBillSelectContactState();
  }

}

//the list generator

class SharedBillSelectContactState extends State<SharedBillSelectContact> {

  List<Contact>? _phoneContact;
  bool _permissionDenied = false;
  var states = Map();


  //Here we fetch contact from the mobile (just copy and past from the documentation flutter_contact)
  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }
  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final phoneContacts = await FlutterContacts.getContacts(withProperties: true, withThumbnail: true);
      setState(() => _phoneContact = phoneContacts);
    }
  }

  // Create a page and display a list of contact
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Select contact')),
          body: _drawContactList(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30), //to put the button to the center
            ElevatedButton(
              onPressed: oneContactOrMoreIsSelected()?(){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    builder: (BuildContext) {
                      return SharedBillForm(getSelectedContactList());
                      //return SendMoneySelectContact(context).view();
                    },
                  ),
                );
              }:null,
              child: Text("Continue"),

            ),
          ],
        )
      ),
          
  );



  Widget _drawContactList() {
    if (_permissionDenied) return Center(child: Text('We need to access contact'));
    if (_phoneContact == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _phoneContact!.length,
        itemBuilder: (context, i) => ListTile(
          title: _drawOneContact(_phoneContact![i]),
          onTap: (){
            String key = _phoneContact![i].phones!.first.number;
            setState(() {
              states[key] = !states[key];
            });
          },
          tileColor: backgroundColor(_phoneContact![i].phones!.first.number),

        ));
  }
  //Given a contact, this function draw a presentation with picture, name and phone number
  Widget _drawOneContact(Contact contact){
    return Container(
      child: Row(
        children: [
          ListContactState().profilePicture(contact, 50),
          Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.displayName, style: TextStyle(fontSize: 22), textAlign: TextAlign.left,),
              Text(contact.phones.isNotEmpty ? contact.phones.first.number : "none",
                  style: TextStyle(fontSize: 15, color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
 Color backgroundColor(String key){
   if(states[key] == null){
     states[key] = false;
   }
   if(states[key]){
     return Colors.lightBlue.shade50;
   }
    return Colors.transparent;
 }

 bool oneContactOrMoreIsSelected(){
    bool oneSelectedContact = false;
    states.forEach((key, selected) {
      if(selected){
        oneSelectedContact = true;
      }
    });
    return oneSelectedContact;
 }
 List<Contact> getSelectedContactList(){
    List<Contact> selectedContacts = [];
    states.forEach((keyPhoneNumber, selected) {
      if(selected){
        _phoneContact!.forEach((contact) {
          if(contact.phones!.first.number == keyPhoneNumber){
            selectedContacts.add(contact);
          }
        });
      }
    });
    return selectedContacts;
 }

}
