import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';

class PageBars extends StatefulWidget {
  PageBars({Key key}) : super(key: key);

  @override
  _PageBarsState createState() => _PageBarsState();
}

class _PageBarsState extends State<PageBars> {

  MapController                                         _mapController ;
  StatefulMapController                                 _statefulMapController ;
  StreamSubscription<StatefulMapControllerStateChange>  _streamSubscription ;

  @override
  void initState() {
    /// Initializes the controllers
    _mapController = MapController() ;
    _statefulMapController = StatefulMapController(mapController: _mapController) ;

    /// Wait for the controller to be ready before using it
    _statefulMapController.onReady.then((_) => print("The map controller is ready"));

    /// Listen to the change feed to rebuild the map on changes : this will
    /// rebuild the map when, for example, addMarker or any method that mutates
    /// the map assets is called
    _streamSubscription = _statefulMapController.changeFeed.listen((changes) =>
        setState(() {})
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bars"),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(48.853831, 2.348722),
                zoom: 11.0
              ),
              layers: [
                MarkerLayerOptions(
                  markers: _statefulMapController.markers,
                ),
                PolylineLayerOptions(
                  polylines: _statefulMapController.lines,
                ),
                PolygonLayerOptions(
                  polygons: _statefulMapController.polygons,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

}