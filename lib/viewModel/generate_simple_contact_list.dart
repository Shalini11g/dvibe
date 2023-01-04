import 'dart:typed_data';
import 'package:bill_splitter/view/fail_page.dart';
import 'package:bill_splitter/viewModel/checkPhoneNumber.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';

/*
Generic phone contact list.
The class ListContact generate a generic phone contact list
that can be finetune to do more specific task.

Just give a function on the constructor, this function will be call when
a contact is tap. The taped contact is send into the function.

example :
void printContact(Contact contact){
  debugPrint(contact.displayName);
}
ListContact(printContact)

Then, the function will print the taped contact.
 */

//the view that generate a simple list of contact
class ListContact extends StatefulWidget {
  Function? actionOnTap;
  ListContact(Function(Contact) actionToDoWhenAContactIsTap){
    this.actionOnTap = actionToDoWhenAContactIsTap;
  }

  @override
  ListContactState createState() => ListContactState.customFunction(action);

  action(Contact contact){
    if(actionOnTap == null){
      debugPrint(contact.displayName);
    }else{
      actionOnTap!(contact);
    }

  }
}

//the list generator

class ListContactState extends State<ListContact> {

  List<Contact>? _phoneContact;
  bool _permissionDenied = false;


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
          body: _drawContactList()));

  //the interesting part, draw the list of contact fetched from the phone
  //each contact is draw with the function _drawOneContact
  //When a contact is tap, the function _actionDoToWhenAContactIsTap is triggered
  // actionDoToWhenAContactIsTap is the custom function give in ListContact(function)
  Widget _drawContactList() {
    if (_permissionDenied) return Center(child: Text('We need to access contact'));
    if (_phoneContact == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _phoneContact!.length,
        itemBuilder: (context, i) => ListTile(
          title: _drawOneContact(_phoneContact![i]),
          onTap: (){
            if(PhoneChecker.checkOne(_phoneContact![i].phones.first.number).isOk){
              actionDoToWhenAContactIsTap!(_phoneContact![i]);
            }else{
              Navigator.of(context!).push(
                MaterialPageRoute(
                  builder: (BuildContext) {
                    return FailPage("This contact is incorrect number\n    Please, add the country code");
                  },
                ),
              );
            }
          },

        ));
  }
  //Given a contact, this function draw a presentation with picture, name and phone number
  Widget _drawOneContact(Contact contact){
    return Row(
      children: [
        profilePicture(contact,50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.displayName, style: TextStyle(fontSize: 22), textAlign: TextAlign.left,),
            Text(contact.phones.isNotEmpty ? contact.phones.first.number : "none",
                style: TextStyle(fontSize: 15, color: Colors.grey))
          ],
        )
      ],
    );
  }

  Container profilePicture(Contact contact, double size){
    return Container(
      width: size,
      height: size,
      //margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: (contact.thumbnail != null)? DecorationImage(image: MemoryImage(contact.thumbnail!),scale: 0.8):null,
          color: Colors.blue
      ),
      child: (contact.thumbnail == null)? Icon(Icons.person, color: Colors.white,size: size/2,):null,
    );
  }

  Function? actionDoToWhenAContactIsTap;
  ListContactState.customFunction(Function(Contact)? actionDoToWhenAContactIsTap){
    this.actionDoToWhenAContactIsTap = actionDoToWhenAContactIsTap;
  }
  ListContactState(){

  }
}
