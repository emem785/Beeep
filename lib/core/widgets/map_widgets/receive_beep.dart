import 'dart:async';

import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/core/widgets/map_widgets/top_bar.dart';
import 'package:latlong/latlong.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/core/utils/StyleGuide.dart';
import 'package:beep/core/widgets/common_widgets/spinner.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:beep/infrastructure/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../application/blocs/navigation_bloc/navigation_bloc.dart';
import '../../../application/blocs/location_bloc/location_bloc.dart';

const double ZOOM = 17;

class ReceiveBeep extends StatefulWidget {
  @override
  _ReceiveBeepState createState() => _ReceiveBeepState();
}

class _ReceiveBeepState extends State<ReceiveBeep> {
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

  Future<bool> _onWillPop(MapBloc mapBloc) async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?', style: nunitoMid),
            content: new Text('Do you want to stop receiving Broadcast',
                style: nunitoMid),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('NO', style: nunitoMidPromptPink),
              ),
              new FlatButton(
                onPressed: () {
                  mapBloc.add(StopSecondBroadcast());
                  Navigator.of(context).pop(true);
                },
                child: new Text('YES', style: nunitoMidPrompt),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void dispose() {
    super.dispose();
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final locationBloc = Provider.of<LocationBloc>(context);
    final mapBloc = Provider.of<MapBloc>(context);
    return WillPopScope(
      onWillPop: () => _onWillPop(mapBloc),
      child: LayoutBuilder(builder: (context, size) {
        return Container(
          child: Stack(
            children: <Widget>[
              Container(
                  child: BlocConsumer<MapBloc, MapState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => SizedBox(),
                    receivingBroadcast: (b) {
                      return StreamBuilder<Location>(
                          stream: b.stream,
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
                                  urlTemplate:
                                      "https://api.tiles.mapbox.com/v4/"
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
                  );
                },
                listener: (context, state) {
                  return state.maybeMap(
                      orElse: () => 1,
                      receivingBroadcast: (b) async {
                        return _subscription = b.stream.listen((event) {
                          if (event.latitude != null) {
                            _updateCameraPostion(event);
                          }
                        });
                      },
                      broadcastEnded: (n) => _subscription.cancel());
                },
                buildWhen: (previous, next) {
                  if (previous == MapLoading()) {
                    return true;
                  } else {
                    return false;
                  }
                },
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<MapBloc, MapState>(
                  builder: (context, state) {
                    return state.maybeMap(
                        orElse: () => SizedBox(),
                        receivingBroadcast: (b) => Container(
                              color: Colors.grey[100],
                              height: size.maxHeight * 0.2,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Showing the live location of ${b.buddy.firstname} ${b.buddy.lastname}",
                                      style: nunitoSmall,
                                    ),
                                    SizedBox(height: 24),
                                    Text("Get lawyers around location",
                                        style: nunitoSmallGreen)
                                  ],
                                ),
                              )),
                            ),
                        initial: (i) => Container(
                              color: Colors.grey[100],
                              height: size.maxHeight * 0.2,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Showing the live location of Chukwuma Adamu Tayo",
                                      style: nunitoSmall,
                                    ),
                                    SizedBox(height: 24),
                                    Text("Get lawyers around location",
                                        style: nunitoSmallGreen)
                                  ],
                                ),
                              )),
                            ),
                        loading: (l) => Container(
                              color: Colors.grey[100],
                              height: size.maxHeight * 0.2,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Waiting for details",
                                      style: nunitoSmall,
                                    ),
                                    LoadingIndicator()
                                  ],
                                ),
                              )),
                            ));
                  },
                ),
              ),
              TopBar(),
            ],
          ),
        );
      }),
    );
  }
}
