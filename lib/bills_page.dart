import 'package:flutter/material.dart';
import 'pay_bills.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigation to home_button-> BillsPage button.
          Navigator.of(context).push(
            MaterialPageRoute(
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              builder: (BuildContext) {
                return const PayBillButtonPage();
              },
            ),
          );
        },
        child: const Text('Pay Bill'),
      ),
    );
  }
}
