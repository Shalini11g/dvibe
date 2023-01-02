import 'package:bill_splitter/model/sharedBillParticipant.dart';
import 'package:bill_splitter/model/user.dart';

//when more than one people have to pay the same bill, this is a shared bill
class SharedBill{
  UserApp? from;
  List<SharedBillParticipant>? to;
  String comment = "";

  SharedBill(UserApp from, List<SharedBillParticipant> to, String comment){
    this.from = from;
    this.to = to;
    this.comment = comment;
  }

  double totalAmount(){
    double total = 0;
    to!.forEach((participant) {
      total += participant.amount;
    });
    return total;
  }
  double totalReimbursed(){
    double total = 0;
    to!.forEach((participant) {
      if(participant.hasPay){
        total += participant.amount;
      }
    });
    return total;
  }

}