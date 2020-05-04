import 'package:flutter/material.dart';
import 'package:projet_b3/model/bar.dart';
import 'package:projet_b3/old_pages/page_bar.dart';
import 'package:projet_b3/old_pages/page_favorites.dart';

Widget  barItem(context, Bar item, int index, bool isDismissible,
    onItemDismissed) {

  return Dismissible(
    key: Key("test"),
    onDismissed: (direction) {
      onItemDismissed(index);
    },
    background: Container(
      child: Image.asset(
        "assets/delete.png",
        scale: 0.5,
      ),
    ),
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: <Widget>[
          Image.network(item.imageUrl),
          Row(
            children: <Widget>[
              Icon(Icons.ac_unit),
              Column(
                children: <Widget>[
                  Text(item.name)
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}