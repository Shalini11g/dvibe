import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard_page.dart';

class SuccessPage extends StatelessWidget{
  String billOrTranser = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Success")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon( Icons.done_all, size: 150,color: Colors.green,),
              Text("Your "+billOrTranser+" is succesfully sent",style: TextStyle(fontSize: 20),),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      return DashboardPage();
                    }), (r){
                      return false;
                    });
                  },
                  child: Text("Continue")
              ),
              SizedBox(height: 50),
            ],
          ),
        )
      )
    );
  }
  SuccessPage(String billOrTranser){
    this.billOrTranser = billOrTranser;
  }
}