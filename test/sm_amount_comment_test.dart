
import 'package:flutter_test/flutter_test.dart';
import 'package:bill_splitter/viewModel/sm_amount_comment_vm.dart';

void main(){
  test("Test amount input of the send money form controller", (){
    expect(SendMoneyformController("-5","").isOk, false);
    expect(SendMoneyformController("0","").isOk, false);
    expect(SendMoneyformController("1","").isOk, true);
    expect(SendMoneyformController("12.14","").isOk, true);
    expect(SendMoneyformController("150","").isOk, true);
    expect(SendMoneyformController("4999","").isOk, true);
    expect(SendMoneyformController("4999.99","").isOk, true);
    expect(SendMoneyformController("5001","").isOk, false);
    expect(SendMoneyformController("10.50.10","").isOk, false);
    expect(SendMoneyformController("10,50.10","").isOk, false);
    expect(SendMoneyformController("-10,50.10","").isOk, false);
    expect(SendMoneyformController("10,5","").isOk, true);
    expect(SendMoneyformController("10.015345321","").isOk, false);
    expect(SendMoneyformController("","").isOk, false);
  });
  test("Check error message",(){
    expect(SendMoneyformController("-5","").issue, "Amount should be supperior to 0");
    expect(SendMoneyformController("0","").issue, "Amount should be supperior to 0");
    expect(SendMoneyformController("1","").issue, "");
    expect(SendMoneyformController("100000","").issue, "This amount is too big");
    expect(SendMoneyformController("1.0.0","").issue, "Invalid amount");
    expect(SendMoneyformController("1.5645646546575765","").issue, "Too long decimal part");
    expect(SendMoneyformController("","").issue, "Empty amount");

  });
}