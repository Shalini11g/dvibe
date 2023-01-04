import 'package:bill_splitter/viewModel/checkPhoneNumber.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("test invalid number", () => {
    expect(PhoneChecker.checkOne("564 56456 4564").isOk,false),
    expect(PhoneChecker.checkOne("(564) 65 54+54").isOk,false),
    expect(PhoneChecker.checkOne("sdfdes56fd").isOk,false)
  });
  test("test valid number", () => {
    expect(PhoneChecker.checkOne("+5645724545").isOk,true),
    expect(PhoneChecker.checkOne("+336 75 15 75 42").isOk,true),
    expect(PhoneChecker.checkOne("+78 (545) 224").isOk,true)
  });
  test("test format phone number", () => {
    expect(PhoneChecker().formatPhoneNumber("+564 45 21"),"+5644521"),
    expect(PhoneChecker().formatPhoneNumber("+(564) 45 21"),"+5644521"),
    expect(PhoneChecker().formatPhoneNumber("+564-45 21"),"+5644521"),
  });

}