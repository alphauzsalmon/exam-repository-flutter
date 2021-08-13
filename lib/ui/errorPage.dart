import 'package:flutter/material.dart';

class SomethingErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Error Page",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          "FireBase ulanmadi...",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
