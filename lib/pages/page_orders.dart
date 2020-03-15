import 'package:flutter/material.dart';

class PageOrders extends StatefulWidget {
  PageOrders({Key key}) : super(key: key);

  @override
  _PageOrdersState createState() => _PageOrdersState();
}

class _PageOrdersState extends State<PageOrders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Orders"),
      ),
      body: new Center(

      ),
    );
  }
}