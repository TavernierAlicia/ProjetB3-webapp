import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

/// We are using MapBox
class PageBars extends StatefulWidget {
  PageBars({Key key}) : super(key: key);

  @override
  _PageBarsState createState() => _PageBarsState();
}

class _PageBarsState extends State<PageBars> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bars"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(51.5, -0.09),
                zoom: 5.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
                )
//            MarkerLayerOptions(markers: markers)
              ],
            ),
          )
        ],
      )
    );
  }

}