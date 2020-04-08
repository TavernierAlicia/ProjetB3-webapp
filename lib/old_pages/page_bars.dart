import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:projet_b3/model/bar.dart';

class PageBars extends StatefulWidget {
  PageBars({Key key}) : super(key: key);

  @override
  _PageBarsState createState() => _PageBarsState();
}

class _PageBarsState extends State<PageBars> {

  final         _searchBarController = TextEditingController() ;

  List         _barsList = [
    Bar("TestName0", "TestDescription0", 4, "", LatLng(48.8557579, 2.3753418)),
    Bar("TestName1", "TestDescription1", 4, "", LatLng(43.8557579, 2.3753418)),
    Bar("TestName2", "TestDescription2", 4, "", LatLng(48.8557579, 3.3753418)),
    Bar("TestName3", "TestDescription3", 4, "", LatLng(49.8557579, 3.3753418)),
  ];

  List<Marker>  _markers = [];

  LatLng        _mapCenter = LatLng(51.5, -0.09) ;
  double        _mapZoom = 5.0 ;

  @override
  Widget build(BuildContext context) {

    _markers = _markersGenerator() ;

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
  Widget          _searchBar() {
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
  Widget          _displayMap() {
    return Flexible(
      child: FlutterMap(
        options: MapOptions(
          center: _mapCenter,
          zoom: _mapZoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            tileProvider: NonCachingNetworkTileProvider(),
          ),
          MarkerLayerOptions(markers: _markers)
        ],
      ),
    );
  }

  /// Handles the search when the user submits his search or hit the search
  /// button.
  void            _performSearch() {
    print("Should perform search about ${_searchBarController.text}");
    // TODO
  }

  /// Builds a list of Marker objects, given the bars list.
  /// TODO : This function should be a Future, as it will get a list of bars
  /// TODO :    given the users position.
  List<Marker>    _markersGenerator() {
    List<Marker> result = [];

    _barsList.forEach((bar) {
      result.add(Marker(
        width: 50,
        height: 50,
        point: LatLng(bar.coordinates.latitude, bar.coordinates.longitude),
        builder: (context) => Container(
          child: GestureDetector(
            child: Image.asset(
              'assets/location_pin.png',
              scale: 1.50,
            ),
            onTap: (() {
              print("Clicked on ${bar.name}");
              setState(() {
                // FIXME : Does not seems to work...
                _mapCenter = bar.coordinates ;
                _mapZoom = 10 ;
              });
            }),
          ),
        ),
      ));
    });

    return result ;
  }

}