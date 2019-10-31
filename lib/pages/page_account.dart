import 'package:flutter/material.dart';

class PageAccount extends StatefulWidget {
  PageAccount({Key key}) : super(key: key);

  @override
  _PageAccountState createState() => _PageAccountState();
}

class _PageAccountState extends State<PageAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account"),
      ),
      body: new Center(

      ),
    );
  }
}