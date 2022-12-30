import 'package:bill_splitter/viewModel/sm_strNumber_operation.dart';
import 'package:flutter/cupertino.dart';

//Send money controller
//Give the value to check in the constructor
class SendMoneyformController{
  //say if all value are good
  bool isOk = false;
  //explain why some value are wrong
  String issue = "";

  //string analysis of the amount
  bool checkStringOfAmountOfMoney(String amountOfMoney){
    List<String> splitedAmount = amountOfMoney.split(".");

    if(splitedAmount.length > 2){
      debugPrint("Invalid amount");
      this.issue = "Invalid amount";
    }else if(strNumber().getDecimalPart(amountOfMoney).length>3){
      debugPrint("Too long decimal part");
      this.issue = "Too long decimal part";
    }else{
      return true;
    }
    return false;
  }
  //double analysis of the amount
  bool checkAmountOfMoney(double amountOfMoney){
    if(amountOfMoney <= 0){
      debugPrint("Amount should be supperior to 0");
      this.issue = "Amount should be supperior to 0";
    }else if(amountOfMoney > 5000){
      debugPrint("This amount is too big");
      this.issue = "This amount is too big";
    }else{
      return true;
    }
    return false;
  }
  //analysis of the comment
  bool checkComment(String comment){
    if(comment.length>512){
      debugPrint("This comment is too long");
      this.issue = "This comment is too long";
    }else{
      return true;
    }
    return false;

  }

  SendMoneyformController(String amount, String comment){
    amount = strNumber().cleanNumber(amount);
    isOk = amount.length>0;
    if(!isOk){
      this.issue = "Empty amount";
    }
    isOk = isOk && checkStringOfAmountOfMoney(amount);
    isOk = isOk && checkAmountOfMoney(double.parse(amount));
    isOk = isOk && checkComment(comment);
  }
}