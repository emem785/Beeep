import 'package:beep/infrastructure/models/map_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Map extends StatelessWidget {
  final MapTool mapTool;
  final Stream<Marker> markerStream;
  final mapThemes = List<String>.unmodifiable([
    "ckc7ed5ov0kjf1irq933898oa",
    "cke061zz7148i19o9vmk8uua2",
    "cke06gp5k14l219mwmadxy617"
  ]);

  Map({Key key, @required this.mapTool, @required this.markerStream})
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
                  'id': 'emem785/${mapThemes[0]}/tiles/256',
                },
              ),
              MarkerLayerOptions(
                markers: [snapshot.data],
              ),
            ],
          );
        });
  }
}
