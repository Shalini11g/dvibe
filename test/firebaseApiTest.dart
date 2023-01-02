

import 'package:bill_splitter/model/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test get transaction Id", () async {
    int transactionID = await Api().getTransactionId();
    expect(transactionID>=0, true);
  });
  test("Test get bill Id", () async {
    int billId = await Api().getBillId();
    expect(billId>=0, true);
  });
}