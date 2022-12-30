import 'package:bill_splitter/viewModel/sm_strNumber_operation.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Testing clean number", (){
    expect(strNumber().cleanNumber("15,5"),"15.5");
    expect(strNumber().cleanNumber("15.5"),"15.5");
  });
  test("Testing real part",(){
    expect(strNumber().getRealPart("5.45"), "\$5,");
    expect(strNumber().getRealPart("12.45"), "\$12,");
    expect(strNumber().getRealPart("75"), "\$75,");
    expect(strNumber().getRealPart("12.75"), "\$12,");
  });
  test("Testing decimal part",(){
    expect(strNumber().getDecimalPart("5.12"), "12");
    expect(strNumber().getDecimalPart("5.12"), "12");
    expect(strNumber().getDecimalPart("75.15"), "15");
    expect(strNumber().getDecimalPart("5"), "00");
    expect(strNumber().getDecimalPart("5.1"), "10");
    expect(strNumber().getDecimalPart("12."), "00");
    expect(strNumber().getDecimalPart("12.0"), "00");
    expect(strNumber().getDecimalPart("12.01"), "01");
    expect(strNumber().getDecimalPart("12.0123"), "0123");
  });
}