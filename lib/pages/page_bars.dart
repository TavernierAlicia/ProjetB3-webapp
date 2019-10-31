import 'package:flutter/material.dart';
import 'package:projet_b3/model/Bar.dart';
import 'package:projet_b3/views/bar_item.dart';

class PageBars extends StatefulWidget {
  PageBars({Key key}) : super(key: key);

  @override
  _PageBarsState createState() => _PageBarsState();
}

class _PageBarsState extends State<PageBars> {

  List _bars = [Bar];

  @override
  void initState() {
    getBars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bars"),
      ),
      body: ListView.builder(
        itemCount: _bars.length,
        itemBuilder: (context, i) {
          return barItem(_bars[i]);
        },
      ),
    );
  }



  /// This will get a list of bars near the user.
  /// However, for testing purposes, we are actually creating a static array
  /// containing placeholder data.
  Future<Null> getBars() async {
    /// TODO : Async call with await to an API
    List newList = [
      Bar("La bonne bouteille", "Bieres et vins en tout genre !", 2, "https://s2.qwant.com/thumbr/0x380/7/b/4f6a521d48836429d393cccec3f6bc2c380c40498f8942d404ed564ce6a458/05e391f1f33c310f7c1a833d99e23989.jpg?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F05%2Fe3%2F91%2F05e391f1f33c310f7c1a833d99e23989.jpg&q=0&b=1&p=0&a=1"),
      Bar("La bonne biere", "Les meilleures bieres du monde", 4, "https://s2.qwant.com/thumbr/0x380/7/b/4f6a521d48836429d393cccec3f6bc2c380c40498f8942d404ed564ce6a458/05e391f1f33c310f7c1a833d99e23989.jpg?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F05%2Fe3%2F91%2F05e391f1f33c310f7c1a833d99e23989.jpg&q=0&b=1&p=0&a=1"),
      Bar("Le cul de la boiteuse", "Ambiance grivoise et biere pas chere", 3, "https://s2.qwant.com/thumbr/0x380/7/b/4f6a521d48836429d393cccec3f6bc2c380c40498f8942d404ed564ce6a458/05e391f1f33c310f7c1a833d99e23989.jpg?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F05%2Fe3%2F91%2F05e391f1f33c310f7c1a833d99e23989.jpg&q=0&b=1&p=0&a=1"),
      Bar("La Taverne de Blancherive", "Armure obligatoire", 2, "https://s2.qwant.com/thumbr/0x380/7/b/4f6a521d48836429d393cccec3f6bc2c380c40498f8942d404ed564ce6a458/05e391f1f33c310f7c1a833d99e23989.jpg?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F05%2Fe3%2F91%2F05e391f1f33c310f7c1a833d99e23989.jpg&q=0&b=1&p=0&a=1"),
      Bar("Schlumpfi", "Saucisses, biere locale et insultes en allemand", 5, "https://s2.qwant.com/thumbr/0x380/7/b/4f6a521d48836429d393cccec3f6bc2c380c40498f8942d404ed564ce6a458/05e391f1f33c310f7c1a833d99e23989.jpg?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F05%2Fe3%2F91%2F05e391f1f33c310f7c1a833d99e23989.jpg&q=0&b=1&p=0&a=1"),
    ] ;
    if (newList.isNotEmpty) {
      setState(() {
        _bars = newList;
      });
    }
  }
}