import 'package:flutter_contacts/contact.dart';

class PhoneChecker{
  bool isOk = false;
  PhoneChecker.checkOne(String phoneNumber){
    this.isOk = _isNumberOk(phoneNumber);
  }
  PhoneChecker.checkContactList(List<Contact> contactList){
    bool isOk = true;
    contactList.forEach((contact) {
      isOk = isOk && _isNumberOk(contact.phones.first.number);
    });
    this.isOk = isOk;
  }
  PhoneChecker(){

  }
  bool _isNumberOk(String phoneNumber){
    return phoneNumber[0] == "+";
  }
  String formatPhoneNumber(String phoneNumber){
    phoneNumber = phoneNumber.replaceAll(' ', "");
    phoneNumber = phoneNumber.replaceAll('-', "");
    phoneNumber = phoneNumber.replaceAll('(', "");
    phoneNumber = phoneNumber.replaceAll(')', "");
    phoneNumber = phoneNumber.replaceAll('[', "");
    phoneNumber = phoneNumber.replaceAll(']', "");
    return phoneNumber;
  }
}