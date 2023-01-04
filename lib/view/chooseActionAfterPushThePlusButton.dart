// ignore: file_names
import 'package:bill_splitter/view/ask_money_select_contact.dart';
import 'package:bill_splitter/view/sm_select_contact_view.dart';
import 'package:flutter/material.dart';

class ChooseActionAfterPushThePlusButton extends StatelessWidget {
  const ChooseActionAfterPushThePlusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("What do you want to do?"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext) {
                              return SendMoneySelectContact(context).view();
                            },
                          ),
                        );
                      },
                      child: const Text("Send money")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext) {
                              return AskMoneySelectContact(context).view();
                            },
                          ),
                        );
                      },
                      child: const Text("Ask for money")),
                  ElevatedButton(
                      onPressed: () {
                        debugPrint("split bill page");
                      },
                      child: const Text("Split bill")),
                ],
              ),
            )));
  }
}
