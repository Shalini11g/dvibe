import 'package:bill_splitter/viewModel/generate_simple_contact_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

class SharedBillForm extends StatefulWidget{
  List<Contact> contactList = [];
  SharedBillForm(List<Contact> contactList){
    this.contactList = contactList;
  }

  @override
  State<StatefulWidget> createState() {
    return SharedBillFormState(contactList);
  }

}
class SharedBillFormState extends State<SharedBillForm>{
  List<double> personalAmount = [];
  List<Contact> contactList = [];
  String totalAmountInput = "";
  var amountController = TextEditingController();

  SharedBillFormState(List<Contact> contactList){
    this.contactList = contactList;
    //set repartition to 0$ for every selected contact
    contactList.forEach((element) {
      personalAmount.add(0);
    });
    //include yourself
    personalAmount.add(0);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Split the bill"),),
        body: SingleChildScrollView(
          child: _body()
        )
      ),
    );
  }

  Widget _body(){
    amountController.text = this.totalAmountInput;
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          "Total amount:",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: "in dollars \$", border: OutlineInputBorder()),
          onEditingComplete: (){
            setState(() {
              this.totalAmountInput = amountController.text;
              updateRepartition(double.parse(amountController.text));
            });
            FocusScopeNode currentFocus = FocusScope.of(context);
            currentFocus.unfocus();
          },
        ),
        SizedBox(height: 30),
        Text("Message:", style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLength: 512,
          maxLines: 5,
          minLines: 5,
          decoration: const InputDecoration(
              hintText: "Thank you for helping!",
              border: OutlineInputBorder()),
        ),
        SizedBox(height: 20),
        Text("Repartition:", style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: contactList!.length+1,
            itemBuilder: (context, i) => ListTile(
              title: _drawOneContact((i==0)?Contact():contactList![i-1],i),

            )),
        SizedBox(height: 20),
        ElevatedButton(onPressed: (){

        }, child: Text("Share bill")),
        SizedBox(height: 20),

      ],
    );
  }

  Widget _drawOneContact(Contact contact, int index){
    var inputController = TextEditingController();
    inputController.text = personalAmount[index].toStringAsFixed(2);
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            _drawContact(contact, index),
            SizedBox(width: 20),
            Expanded(child: Text("")),
            SizedBox(width: 100,
            child: TextFormField(
              textAlign: TextAlign.right,
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none),
              onEditingComplete: (){
                setState(() {
                  personalAmount[index] = double.parse(inputController.text);
                  updateTotalRepartition();
                });
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();
              },
              ),
            ),

            Text("\$"),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
  Widget _drawContact(Contact contact, int index){
    if(index == 0){
      return Row(
        children: [
          ListContactState().profilePicture(Contact(),50),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("You", style: TextStyle(fontSize: 22), textAlign: TextAlign.left,),
            ],
          ),
        ],
      );
    }
    return Row(
      children: [
        ListContactState().profilePicture(contact,50),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(contact.displayName, style: TextStyle(fontSize: 22), textAlign: TextAlign.left,),
          Text(contact.phones.isNotEmpty ? contact.phones.first.number : "none",
          style: TextStyle(fontSize: 15, color: Colors.grey))
        ],
        ),
      ],
    );
  }
  void updateRepartition(double totalAmount){
    double amount = totalAmount/personalAmount.length;
    for(int i =0;i<personalAmount.length;i++){
      personalAmount[i] = amount;
    }
  }
  void updateTotalRepartition(){
    double amount = 0;
    personalAmount.forEach((element) {
      amount+=element;
    });
    debugPrint("total amount"+ amount.toString());
    //this is the amount in Total amount field
    this.totalAmountInput = amount.toStringAsFixed(2);
  }


}