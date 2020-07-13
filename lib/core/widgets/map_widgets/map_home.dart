import 'dart:async';

import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/core/widgets/map_widgets/top_bar.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import '../../../application/blocs/navigation_bloc/navigation_bloc.dart';
import '../../../application/blocs/location_bloc/location_bloc.dart';

const double ZOOM = 17;

class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  MapController controller = MapController();
  StreamSubscription<Location> _subscription;
  Marker _marker = Marker();

  _updateCameraPostion(Location event) {
    controller.move(LatLng(event.latitude, event.longitude), ZOOM);
    setState(() {
      _marker = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(event.latitude, event.longitude),
        builder: (ctx) => new Container(
          child: Icon(Icons.location_on, color: Colors.red),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationBloc = Provider.of<LocationBloc>(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              child: BlocConsumer<LocationBloc, LocationState>(
            builder: (context, state) {
              return state.maybeMap(
                  orElse: () => SizedBox(),
                  broadcasting: (b) {
                    return StreamBuilder<Location>(
                        stream: b.locationStream,
                        initialData: b.location,
                        builder: (context, snapshot) {
                          return FlutterMap(
                            options: MapOptions(
                              center: LatLng(
                                  b.location.latitude, b.location.longitude),
                              zoom: ZOOM,
                            ),
                            mapController: controller,
                            layers: [
                              TileLayerOptions(
                                urlTemplate: "https://api.tiles.mapbox.com/v4/"
                                    "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                                additionalOptions: {
                                  'accessToken':
                                      'pk.eyJ1IjoiZW1lbTc4NSIsImEiOiJjazVmOTViZ2EyZjZpM2xxaGFjNmVqMmxpIn0.IrkZKaDokjBJ3mnKnNzfoQ',
                                  'id': 'mapbox.mapbox-streets-v8',
                                },
                              ),
                              MarkerLayerOptions(
                                markers: [_marker],
                              ),
                            ],
                          );
                        });
                  },
                  notBroadcasting: (n) {
                    return FlutterMap(
                      options: MapOptions(
                        center:
                            LatLng(n.location.latitude, n.location.longitude),
                        zoom: ZOOM,
                      ),
                      mapController: controller,
                      layers: [
                        TileLayerOptions(
                          urlTemplate: "https://api.tiles.mapbox.com/v4/"
                              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                          additionalOptions: {
                            'accessToken':
                                'pk.eyJ1IjoiZW1lbTc4NSIsImEiOiJjazVmOTViZ2EyZjZpM2xxaGFjNmVqMmxpIn0.IrkZKaDokjBJ3mnKnNzfoQ',
                            'id': 'mapbox.mapbox-streets-v8',
                          },
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                                point: LatLng(
                                    n.location.latitude, n.location.longitude),
                                builder: (ctx) => new Container(
                                      child: Icon(Icons.location_on,
                                          color: Colors.red),
                                    ),
                                width: 80.0,
                                height: 80.0)
                          ],
                        ),
                      ],
                    );
                  });
            },
            listener: (context, state) {
              return state.maybeMap(
                  orElse: () => 1,
                  broadcasting: (b) {
                    return _subscription = b.locationStream.listen((event) {
                      if (event.latitude != null) {
                        _updateCameraPostion(event);
                      }
                    });
                  },
                  notBroadcasting: (n) => _subscription.cancel());
            },
            buildWhen: (previous, next) {
              if (previous == Initial()) {
                return true;
              } else {
                return false;
              }
            },
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150.0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: BlocBuilder<NavigationBloc, NavigationState>(
                  builder: (context, state) {
                    return state.maybeMap(
                        orElse: () => SizedBox(),
                        mapHome: (m) =>
                            BlocBuilder<LocationBloc, LocationState>(
                              builder: (context, state) => state.map(
                                initial: (i) =>
                                    StartBeep(locationBloc: locationBloc),
                                broadcasting: (b) =>
                                    StopBeep(locationBloc: locationBloc),
                                notBroadcasting: (n) =>
                                    ResumeBeep(locationBloc: locationBloc),
                              ),
                            ));
                  },
                ),
              ),
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}

class StopBeep extends StatelessWidget {
  const StopBeep({
    Key key,
    @required this.locationBloc,
  }) : super(key: key);

  final LocationBloc locationBloc;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        locationBloc.add(StopBroadcast());
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.red,
      child: Text('STOP BEEEP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}

class ResumeBeep extends StatelessWidget {
  const ResumeBeep({
    Key key,
    @required this.locationBloc,
  }) : super(key: key);

  final LocationBloc locationBloc;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        locationBloc.add(ResumeBroadcast());
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.green,
      child: Text('SEND BEEEP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}

class StartBeep extends StatelessWidget {
  const StartBeep({
    Key key,
    @required this.locationBloc,
  }) : super(key: key);

  final LocationBloc locationBloc;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        locationBloc.add(BroadcastLocation());
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.green,
      child: Text('SEND BEEEP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}
