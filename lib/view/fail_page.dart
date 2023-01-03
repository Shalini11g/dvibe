import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard_page.dart';

class FailPage extends StatelessWidget{
  String message = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Failed")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon( Icons.error_outline, size: 150,color: Colors.deepOrange,),
                  Text(message,style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Go back")
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                          return DashboardPage();
                        }), (r){
                          return false;
                        });
                      },
                      child: Text("Cancel")
                  ),
                  SizedBox(height: 30),
                ],
              ),
            )
        )
    );
  }
  FailPage(String message){
    this.message = message;
  }
}