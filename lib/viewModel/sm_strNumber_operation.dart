class strNumber{
  String getRealPart(String number){
    List<String> splitedAmount = number.split(".");
    return "\$"+splitedAmount[0]+",";
  }
  String getDecimalPart(String number){
    List<String> splitedAmount = number.split(".");
    String decimalPart = "00";
    if(splitedAmount.length >=2){
      decimalPart = splitedAmount[1];
    }

    if(decimalPart.length == 0){
      decimalPart = "00";
    }else if(decimalPart.length == 1){
      decimalPart = decimalPart+"0";
    }
    return decimalPart;
  }
  String cleanNumber(String number){
    number = number.replaceAll(",", ".");
    return number;
  }
}