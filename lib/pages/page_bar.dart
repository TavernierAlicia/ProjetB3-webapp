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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(_bar.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://s1.qwant.com/thumbr/0x380/1/2/2a39f1f558f2cbbec11a08e43493bde861d612add6be643dbc5ad6fe0b16fc/BDBE5B56-B1B4-586D-27C8A70A4A54E50A.jpg?u=https%3A%2F%2Fimages.bwwstatic.com%2Fcolumnpic6%2FBDBE5B56-B1B4-586D-27C8A70A4A54E50A.jpg&q=0&b=1&p=0&a=1",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: _offer(_bar),
      ),
    );
  }

  /// Displays the section that handles the offers list.
  Widget _offer(Bar bar) {
    return Column(
      children: <Widget>[
        Text(
          "Our offer",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        Padding(padding: EdgeInsets.all(20)),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _productsList.length,
            itemBuilder: (context, i) {
              return productItem(context, _productsList[i]);
            },
          ),
        )
      ],
    );
  }

}