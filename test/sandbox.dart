
import 'package:bill_splitter/model/firebaseDatabase.dart';
import 'package:bill_splitter/model/transaction.dart';
import 'package:http/http.dart' as http;

void main(){
  FirebaseDatabase test = new FirebaseDatabase();

  List<Transaction> transaction = test.getTransactions();
  transaction.forEach((element) {
    print(element.comment);
    print(element.amount);
    print(element.to?.phoneNumber);
    print(element.to?.name);
    print(http.get(Uri.parse('https://d-vibe-default-rtdb.europe-west1.firebasedatabase.app/newBill.json')));
  });
}