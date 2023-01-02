import 'package:bill_splitter/view/dashboard_page.dart';
import 'package:bill_splitter/view/homePage.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:bill_splitter/login_pages.dart';

// import 'package:bill_splitter/widget_tree.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_lib/auth.dart';
// import 'package:bill_splitter/statistics_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hiding the demo banner on the emulator
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{'/dashboard': (_) => new DashboardPage()},
    );
  }
}

