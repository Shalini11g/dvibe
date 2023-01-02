import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialising the Firebase
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return LoginScreen();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })));
  }
}