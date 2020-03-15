import 'package:flutter/material.dart';
import 'package:projet_b3/model/bar.dart';
import 'package:projet_b3/model/product.dart';
import 'package:projet_b3/views/product_item.dart';

class PageBar extends StatefulWidget {
  PageBar({Key key, this.bar}) : super(key: key);

  final Bar bar ;

  @override
  _PageBarState createState() => _PageBarState();
}

class _PageBarState extends State<PageBar> {

  /// This is the list that the bar is selling. Static data for testing
  /// purposes.
  var _productsList = [
    Product("Mojito", "Mint & lime", 10.0, true),
    Product("Punch", "Mint & lime", 10.0, true),
    Product("Unavailable Product", "", 10.0, false),
    Product("Pina Colada", "Mint & lime", 10.0, true),
    Product("Margarita", "Mint & lime", 10.0, true),
    Product("Caipirinha", "Mint & lime", 10.0, true),
    Product("Blue Lagoon", "Mint & lime", 10.0, true),
    Product("Sex on the beach", "Mint & lime", 10.0, true),
    Product("Long Island", "Mint & lime", 10.0, true),
    Product("Bloody Mary", "Mint & lime", 10.0, true),
  ] ;

  @override
  Widget build(BuildContext context) {

    var _bar = widget.bar ;

    return Scaffold(
      appBar: AppBar(
        title: Text(_bar.name),
      ),
      body: _body(_bar),
    );
  }

  Widget _body(Bar bar) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.network(bar.imageUrl),
          _offer(bar),
        ],
      ),
    );
  }

  /// Displays the section that handles the offers list.
  Widget _offer(Bar bar) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Our offer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _productsList.length,
              itemBuilder: (context, i) {
                return productItem(context, _productsList[i]);
              },
            )
          ],
        ),
      ),
    );
  }

}