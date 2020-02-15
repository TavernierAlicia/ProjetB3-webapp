import 'package:flutter/material.dart';
import 'package:projet_b3/model/Product.dart';

Widget productItem(context, Product item) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      children: <Widget>[
        Text(item.name),
      ],
    ),
  );
}