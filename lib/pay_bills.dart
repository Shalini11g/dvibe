import 'package:flutter/material.dart';

class PayBillButtonPage extends StatefulWidget {
  const PayBillButtonPage({super.key});

  @override
  State<PayBillButtonPage> createState() => _PayBillButtonPage();
}

class _PayBillButtonPage extends State<PayBillButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Payment Details'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
    );
  }
}
