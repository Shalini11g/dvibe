import 'dart:typed_data';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';

/*
Generic phone contact list.
The class _ListContactState generate a generic phone contact list
that can be finetune to do more specific task.

Just extends _ListContactState, and override _actionDoToWhenAContactIsTap
 */

//the view that generate a simple list of contact
class ListContact extends StatefulWidget {
  @override
  _ListContactState createState() => _ListContactState();
}

/*the list generator
Please, extend this class to made our own list and override the function _actionDoToWhenAContactIsTap*/
class _ListContactState extends State<ListContact> {
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

  // Create a page and display a list of contact. Usefull only to do some test
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Select contact')),
          body: drawContactList()));

  //the interesting part, draw the list of contact fetched from the phone
  //each contact is draw with the function _drawOneContact
  //When a contact is tap, the function _actionDoToWhenAContactIsTap is triggered
  Widget drawContactList() {
    if (_permissionDenied) return Center(child: Text('We need to access contact'));
    if (_phoneContact == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _phoneContact!.length,
        itemBuilder: (context, i) => ListTile(
          title: _drawOneContact(_phoneContact![i]),
          onTap: (){
            _actionDoToWhenAContactIsTap(_phoneContact![i]);
          },

        ));
  }
  //Given a contact, this function draw a presentation with picture, name and phone number
  Widget _drawOneContact(Contact contact){
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: (contact.thumbnail != null)? DecorationImage(image: MemoryImage(contact.thumbnail!)):null,
              color: Colors.blue
          ),
          child: (contact.thumbnail == null)? Icon(Icons.person, color: Colors.white,):null,
        ),
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

  // Triggered when a contact is tap
  // The tapped contact is give
  //Please, override this function to do another stuff
  _actionDoToWhenAContactIsTap(Contact contact){
    debugPrint(contact.displayName);
  }
}