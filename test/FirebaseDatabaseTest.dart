

import 'package:bill_splitter/model/firebaseDatabase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test get transaction Id", () async {
    int transactionID = await FirebaseDatabase().getTransactionId();
    expect(transactionID>=0, true);
  });
}