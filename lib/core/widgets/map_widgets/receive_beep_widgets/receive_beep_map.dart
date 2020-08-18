import 'package:beep/infrastructure/models/location.dart';
import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ReceiveBeepMap extends StatelessWidget {
  final MapTool mapTool;
  final Stream<Marker> markerStream;

  ReceiveBeepMap({Key key, @required this.mapTool, @required this.markerStream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Marker>(
        stream: markerStream,
        initialData: mapTool.marker,
        builder: (context, snapshot) {
          return FlutterMap(
            options: MapOptions(
              center:
                  LatLng(mapTool.location.latitude, mapTool.location.longitude),
              zoom: ZOOM,
            ),
            mapController: mapTool.mapController,
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/{id}/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiZW1lbTc4NSIsImEiOiJjazVmOTViZ2EyZjZpM2xxaGFjNmVqMmxpIn0.IrkZKaDokjBJ3mnKnNzfoQ',
                  'id': 'emem785/ck5msvzn000hl1inv5gchb7rk/tiles/256',
                },
              ),
              MarkerLayerOptions(markers: [snapshot.data]),
            ],
          );
        });
  }
}
