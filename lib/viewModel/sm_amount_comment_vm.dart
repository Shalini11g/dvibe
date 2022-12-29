


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/sm_ask_for_confirmation.dart';

class SendMoneyformController{
  bool isOk = false;
  bool checkAmountOfMoney(double amountOfMoney){
    if(amountOfMoney <= 0){
      print("Amount should be supperior to 0");
    }else if(amountOfMoney > 5000){
      print("This amount is too big");
    }else{
      return true;
    }
    return false;
  }
  bool checkComment(String comment){
    if(comment.length>512){
      print("This comment is too long");
    }else{
      return true;
    }
    return false;

  }

  SendMoneyformController(String amount, String comment){
    isOk = amount.length>0;
    isOk = isOk && checkAmountOfMoney(double.parse(amount));
    isOk = isOk && checkComment(comment);
  }
}