import 'package:flutter_contacts/flutter_contacts.dart';

class contactTool{
  Future<String> getContactName(String phoneNumber) async {
    final phoneContacts = await FlutterContacts.getContacts(withProperties: true, withThumbnail: true);
    String contactName = phoneNumber; //if we don't find the contact phone number. We return the phone number as name
    phoneContacts.forEach((contact) {
      contact.phones.forEach((contactPhone) {
        if(contactPhone == phoneNumber){
          contactName = contact.displayName;
        }
      });
    });
    return phoneNumber;
  }
}