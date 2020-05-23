import 'package:flutter/material.dart';
import 'package:projet_b3/model/bar.dart';
import 'package:projet_b3/model/product.dart';
import 'package:projet_b3/views/bar_header.dart';

class PageCart extends StatefulWidget {
  PageCart({Key key, this.cartContent, this.bar}) : super(key: key);

  final List<Product> cartContent ;
  final Bar           bar ;

  @override
  _PageCartState createState() => _PageCartState();
}

enum UserPosition {
  unspecified,
  onTheSpot,
  onMyWay,
}

class _PageCartState extends State<PageCart> {

  double          _screenWidth = 0 ;
  UserPosition    _currentUserPosition = UserPosition.unspecified ;

  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Mon panier".toUpperCase(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.deepOrange
        ),
      ),
      body: _body(),
    );
  }

  Widget    _body() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          barHeader(widget.bar, _screenWidth),
          _lineSeparator(),
          _orderSummary(),
          _lineSeparator(),
          _displayTotal(),
          Padding(padding: EdgeInsets.all(10),),
          _userPosition(),
        ],
      ),
    );
  }

  Widget    _userPosition() {
    // TODO : Display items if the user clicks on something
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (() {
              setState(() {
                _currentUserPosition = UserPosition.onTheSpot ;
              });
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  groupValue: _currentUserPosition,
                  value: UserPosition.onTheSpot.index,
                  onChanged: ((newValue){}),
                ),
                Text(
                  "Je suis sur place",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (() {
              setState(() {
                _currentUserPosition = UserPosition.onMyWay ;
              });
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  groupValue: _currentUserPosition,
                  value: UserPosition.onMyWay.index,
                  onChanged: ((newValue){}),
                ),
                Text(
                  "J'arrive dans quelques minutes",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: (_currentUserPosition == UserPosition.onMyWay)
                ? Wrap(
              
            )
                : null,
          ),
        ],
      ),
    );
  }

  Widget    _orderSummary() {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Wrap(
        children: <Widget>[
          Text(
            "Votre commande",
            style: TextStyle(
              fontSize: 15
            ),
          ),
          Padding(padding: EdgeInsets.all(15),),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.cartContent.length,
            itemBuilder: (context, index) {
              Product   _item = widget.cartContent[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${_item.quantity} x ${_item.name}",
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                  Text("${_item.price} €",
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget    _displayTotal() {

    double    _totalPrice = 0 ;

    widget.cartContent.forEach((element) {
      _totalPrice += (element.price * element.quantity);
    });

    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total",
            style: TextStyle(
                fontSize: 15
            ),
          ),
          Text(
            "$_totalPrice €",
            style: TextStyle(
                fontSize: 15
            ),
          ),
        ],
      ),
    );
  }

  Widget    _lineSeparator() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        height: 0.5,
        width: _screenWidth,
        color: Colors.deepOrange,
      ),
    );
  }

}
