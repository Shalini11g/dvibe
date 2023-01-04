import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get_phone_number/get_phone_number.dart';

class ContactTool{
  Future<String> getContactName(String phoneNumber) async {
    String userPhoneNumber = await GetPhoneNumber().get();
    final phoneContacts = await FlutterContacts.getContacts(withProperties: true, withThumbnail: true);
    String contactName = phoneNumber; //if we don't find the contact phone number. We return the phone number as name
    phoneContacts.forEach((contact) {
      contact.phones.forEach((contactPhone) {
        if(contactPhone == phoneNumber){
          contactName = contact.displayName;
        }else if(contactPhone == userPhoneNumber){
          contactName = "You";
        }
      });
    });
    return phoneNumber;
  }
}