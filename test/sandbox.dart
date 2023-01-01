
import 'package:bill_splitter/model/firebaseDatabase.dart';
import 'package:bill_splitter/model/transaction.dart';


void main(){
  FirebaseDatabase test = new FirebaseDatabase();

  List<Transaction> transaction = test.getTransactions();
  transaction.forEach((element) {
    print(element.comment);
    print(element.amount);
    print(element.to?.phoneNumber);
    print(element.to?.name);
  });
}