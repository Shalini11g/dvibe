import 'package:bill_splitter/view/success_page.dart';
import 'package:bill_splitter/viewModel/strNumber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

import '../viewModel/generate_simple_contact_list.dart';
import 'dashboard_page.dart';
import 'fail_page.dart';

class SharedBillConfirmationPage extends StatelessWidget{
  List<Contact> contactList = [];
  List<double> personalAmount = [];
  String totalAmount = "";
  String amountRealPart ="";
  String amountDecimalPart = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Shared bill"),),
        body: SingleChildScrollView(
          child: _body(context),
        ),
      ),
    );
  }
  Widget _body(BuildContext context){
    return Column(
      children: [
        SizedBox(height: 30),
        Icon(Icons.group, size: 50,),
        SizedBox(height: 10),
        Text("You will share a bill of",style: TextStyle(fontSize: 20, color: Colors.black87)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.amountRealPart,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ,Column(
              children: [
                SizedBox(height: 5),
                Text(this.amountDecimalPart,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
              ],)],
        ),
        Text("repartition :",style: TextStyle(fontSize: 20,color: Colors.black87)),
        ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: contactList!.length+1,
            itemBuilder: (context, i) => ListTile(
              title: _drawOneContact((i==0)?Contact():contactList![i-1],i),

            )),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return DashboardPage();
                  }), (r){
                    return false;
                  });
                },
                child: Text("Cancel")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () async {
                  bool success = true;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) {
                      if(success){
                        return SuccessPage("Your shared bill is created");
                      }else{
                        return FailPage("Creation of your shared bill failed\n             Check you network");
                      }
                    },
                  ));
                },
                child: Text("Confirm"))
          ],),
      ],
    );
  }
  Widget _drawOneContact(Contact contact, int index){
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            _drawContact(contact, index),
            SizedBox(width: 20),
            Expanded(child: Text("")),
            Text(strNumber().formatNumber(personalAmount[index].toStringAsFixed(2)))
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
  SharedBillConfirmationPage(List<Contact> contactList,List<double> personalAmount,String totalAmount){
    this.contactList = contactList;
    this.totalAmount = totalAmount;
    this.personalAmount = personalAmount;

    this.amountRealPart = strNumber().getRealPart(totalAmount);
    this.amountDecimalPart = strNumber().getDecimalPart(totalAmount);


  }

}