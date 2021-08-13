import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../loginPage.dart';
import 'errorPage.dart';
import 'loadingPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingErrorPage();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage();
          }
          return LoadingPage();
        });
  }
}
