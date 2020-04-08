import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PageBars extends StatefulWidget {
  PageBars({Key key}) : super(key: key);

  @override
  _PageBarsState createState() => _PageBarsState();
}

class _PageBarsState extends State<PageBars> {

  final         _searchBarController = TextEditingController() ;

  List<Marker> markers = [
    Marker(
      width: 50,
      height: 50,
      point: LatLng(51.5, -0.09),
      builder: (context) => Container(
        child: FlutterLogo(
          colors: Colors.blue,
          key: ObjectKey(Colors.blue),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Bars"),
        ),
        body: Column(
          children: <Widget>[
            _searchBar(),
            _displayMap(),
          ],
        )
    );
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  /// Handles the search bar.
  Widget    _searchBar() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
      child: Wrap(
        children: <Widget>[
          Text(
            "Chercher un bar".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Chercher un bar",
                  ),
                  controller: _searchBarController,
                  onSubmitted: ((_) { _performSearch() ; }),
                ),
              ),
              GestureDetector(
                onTap: (() { _performSearch() ; }),
                child: Image.asset(
                  'assets/search.png',
                  scale: 1.5,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  /// Handles the map display.
  /// We are using Open Street Map, as this is a free to use API.
  Widget    _displayMap() {
    return Flexible(
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
          ),
          MarkerLayerOptions(markers: markers)
        ],
      ),
    );
  }

  /// Handles the search when the user submits his search or hit the search
  /// button.
  void      _performSearch() {
    print("Should perform search about ${_searchBarController.text}");
    // TODO
  }

}