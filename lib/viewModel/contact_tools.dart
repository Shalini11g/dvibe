import 'package:bill_splitter/viewModel/checkPhoneNumber.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get_phone_number/get_phone_number.dart';

class ContactTool{
  Future<String> getContactName(String phoneNumber) async {
    phoneNumber = PhoneChecker().formatPhoneNumber(phoneNumber);
    String userPhoneNumber = await GetPhoneNumber().get();
    userPhoneNumber = PhoneChecker().formatPhoneNumber(userPhoneNumber);
    if(phoneNumber == userPhoneNumber){
      return "You";
    }
    final phoneContacts = await FlutterContacts.getContacts(withProperties: true, withThumbnail: true);
    String contactName = phoneNumber; //if we don't find the contact phone number. We return the phone number as name
    phoneContacts.forEach((contact) {
      contact.phones.forEach((contactPhone) {
        if(PhoneChecker().formatPhoneNumber(contactPhone.number) == phoneNumber){
          contactName = contact.displayName;
        }
      });
    });
    return contactName;
  }
}