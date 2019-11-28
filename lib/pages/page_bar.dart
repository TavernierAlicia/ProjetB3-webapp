import 'package:flutter/material.dart';
import 'package:projet_b3/model/Bar.dart';

class PageBar extends StatefulWidget {
  PageBar({Key key, this.bar}) : super(key: key);

  final Bar bar ;

  @override
  _PageBarState createState() => _PageBarState();
}

class _PageBarState extends State<PageBar> {

  @override
  Widget build(BuildContext context) {

    var _bar = widget.bar ;

    return Scaffold(
      appBar: AppBar(
        title: Text(_bar.name),
      ),
    );
  }

}