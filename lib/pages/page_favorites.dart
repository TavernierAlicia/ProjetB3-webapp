import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:projet_b3/model/bar.dart';
import 'package:projet_b3/views/bar_item.dart';

class PageFavorites extends StatefulWidget {
  PageFavorites({Key key}) : super(key: key);

  @override
  _PageFavoritesState createState() => _PageFavoritesState();
}

class _PageFavoritesState extends State<PageFavorites> {

  List    _favoritesBarsList = [
    Bar(
      "Gatsby Bar",
      "",
      4,
      "https://s1.qwant.com/thumbr/0x380/1/2/2a39f1f558f2cbbec11a08e43493bde861d612add6be643dbc5ad6fe0b16fc/BDBE5B56-B1B4-586D-27C8A70A4A54E50A.jpg?u=https%3A%2F%2Fimages.bwwstatic.com%2Fcolumnpic6%2FBDBE5B56-B1B4-586D-27C8A70A4A54E50A.jpg&q=0&b=1&p=0&a=1",
      LatLng(12, 12),
    ),
    Bar(
      "Dance Again Bar",
      "",
      4,
      "https://s1.qwant.com/thumbr/0x380/b/7/96dc30e4a2364bcfad819f8db4940ae8529b241d22bf13e23676de6d981c00/5c7059b1b52c2.image.jpg?u=https%3A%2F%2Fbloximages.newyork1.vip.townnews.com%2Frichmond.com%2Fcontent%2Ftncms%2Fassets%2Fv3%2Feditorial%2F3%2Fcf%2F3cf70200-ddaf-55ce-82e8-52f880415809%2F5c7059b1b52c2.image.jpg&q=0&b=1&p=0&a=1",
      LatLng(12, 12),
    ),
    Bar(
      "Gatsby Bar",
      "",
      4,
      "https://s1.qwant.com/thumbr/0x380/1/2/2a39f1f558f2cbbec11a08e43493bde861d612add6be643dbc5ad6fe0b16fc/BDBE5B56-B1B4-586D-27C8A70A4A54E50A.jpg?u=https%3A%2F%2Fimages.bwwstatic.com%2Fcolumnpic6%2FBDBE5B56-B1B4-586D-27C8A70A4A54E50A.jpg&q=0&b=1&p=0&a=1",
      LatLng(12, 12),
    ),
    Bar(
      "Dance Again Bar",
      "",
      4,
      "https://s1.qwant.com/thumbr/0x380/b/7/96dc30e4a2364bcfad819f8db4940ae8529b241d22bf13e23676de6d981c00/5c7059b1b52c2.image.jpg?u=https%3A%2F%2Fbloximages.newyork1.vip.townnews.com%2Frichmond.com%2Fcontent%2Ftncms%2Fassets%2Fv3%2Feditorial%2F3%2Fcf%2F3cf70200-ddaf-55ce-82e8-52f880415809%2F5c7059b1b52c2.image.jpg&q=0&b=1&p=0&a=1",
      LatLng(12, 12),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mes bars favoris"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: _favoritesBars(),
      ),
    );
  }

  Widget _favoritesBars() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _favoritesBarsList.length,
      itemBuilder: (context, i) {
        return barItem(context, _favoritesBarsList[i], i, true, _removeItem);
      },
    );
  }

  void _removeItem(int index) {
    setState(() {
      _favoritesBarsList.removeAt(index);
    });
  }
}