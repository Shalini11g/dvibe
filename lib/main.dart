import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bill_splitter/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_lib/auth.dart';
// import 'package:bill_splitter/statistics_page.dart';

import 'package:bill_splitter/bills_page.dart';
import 'package:bill_splitter/history_page.dart';

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
      home: const WidgetTree(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  List<Widget> screens = const [
    BillsPage(),
    HistoryPage(),
    // StatisticsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('D/Vibe'),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Profile clicked');
            },
            icon: const Icon(Icons.account_circle_sharp),
          ),
        ],
      ),
      body: screens[currentPage],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Add bill button clicked');
          },
          child: const Icon(Icons.add)),
      // Bottom Navbar
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.receipt), label: 'Bills'),
          NavigationDestination(icon: Icon(Icons.business), label: 'History'),
          // NavigationDestination(
          // icon: Icon(Icons.chat_rounded), label: 'Statics')
        ],
        // Loading page based on navbar selection
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
