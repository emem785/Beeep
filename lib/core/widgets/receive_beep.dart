import 'package:beep/application/blocs/location_bloc/location_bloc.dart';
import 'package:beep/application/blocs/map_bloc/map_bloc.dart';
import 'package:beep/core/widgets/map_home_widgets/top_bar.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../application/blocs/navigation_bloc/navigation_bloc.dart';
import '../../application/blocs/location_bloc/location_bloc.dart';

const double ZOOM = 18;
const INITIAL_LOCATION = LatLng(30.673850, 104.098267);

class ReceiveBeep extends StatefulWidget {
  final String phone;

  const ReceiveBeep({Key key, @required this.phone}) : super(key: key);
  @override
  _ReceiveBeepState createState() => _ReceiveBeepState();
}

class _ReceiveBeepState extends State<ReceiveBeep> {
  @override
  Widget build(BuildContext context) {
    // final locationBloc = Provider.of<LocationBloc>(context);
    // final mapBloc = Provider.of<MapBloc>(context);
    return Scaffold(
          body: Container(
        child: Stack(
          children: <Widget>[
            Container(
                child:
                    // GoogleMap(
                    //     initialCameraPosition:
                    //         CameraPosition(target: INITIAL_LOCATION, zoom: ZOOM),
                    //   )
                    SizedBox(
              child: Center(child: Text(widget.phone)),
            )),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: SizedBox(
            //     width: 150.0,
            //     child: Padding(
            //       padding: const EdgeInsets.only(bottom: 16.0),
            //       child: BlocBuilder<NavigationBloc, NavigationState>(
            //         builder: (context, state) {
            //           return state.maybeMap(
            //               orElse: () => SizedBox(),
            //               mapHome: (m) => BlocBuilder<MapBloc, MapState>(
            //                     builder: (context, state) => state.map(
            //                         initial: (i) => RaisedButton(
            //                               onPressed: () {
            //                                 mapBloc.add(GetLocationBroadcast());
            //                               },
            //                               shape: RoundedRectangleBorder(
            //                                   borderRadius:
            //                                       BorderRadius.circular(30)),
            //                               color: Colors.green,
            //                               child: Text('receive',
            //                                   style: TextStyle(
            //                                       color: Colors.white,
            //                                       fontWeight: FontWeight.w600)),
            //                             ),
            //                         broadcasting: (b) => RaisedButton(
            //                               onPressed: () {
            //                                 mapBloc.add(StopSecondBroadcast());
            //                               },
            //                               shape: RoundedRectangleBorder(
            //                                   borderRadius:
            //                                       BorderRadius.circular(30)),
            //                               color: Colors.red,
            //                               child: Text('ST',
            //                                   style: TextStyle(
            //                                       color: Colors.white,
            //                                       fontWeight: FontWeight.w600)),
            //                             ),
            //                         notBroadcasting: (n) => RaisedButton(
            //                               onPressed: () {
            //                                 mapBloc.add(GetLocationBroadcast());
            //                               },
            //                               shape: RoundedRectangleBorder(
            //                                   borderRadius:
            //                                       BorderRadius.circular(30)),
            //                               color: Colors.green,
            //                               child: Text('SENDP',
            //                                   style: TextStyle(
            //                                       color: Colors.white,
            //                                       fontWeight: FontWeight.w600)),
            //                             ),
            //                         broadcastError: (b) => SizedBox()),
            //                   ));
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            TopBar(),
          ],
        ),
      ),
    );
  }
}
