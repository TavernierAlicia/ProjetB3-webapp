import 'package:flutter/material.dart';
import 'package:projet_b3/model/Bar.dart';

Widget  barItem(Bar item) {
  return Card(
    child: Row(
      children: <Widget>[
        Image.network(
          item.imageUrl,
          width: 100,
          height: 50,
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(item.name),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  item.description,
                  maxLines: 10,
                ),
              ],
            ),
            Text(item.note.toString() + " / 5")
          ],
        ),
      ],
    ),
  );
}