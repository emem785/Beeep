import 'package:beep/core/utils/enums.dart';
import 'package:beep/core/widgets/map_home_widgets/top_bar.dart';
import 'package:beep/core/widgets/menu_widgets/more_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../application/blocs/navigation_bloc/navigation_bloc.dart';

const double ZOOM = 18;
const INITIAL_LOCATION = LatLng(30.673850, 104.098267);

class HomeMap extends StatefulWidget {
  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: INITIAL_LOCATION, zoom: ZOOM),
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
                        mapHome: (m) => RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.green,
                              child: Text('SEND BEEEP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
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

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
            color: Colors.white,
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            child: MoreMenu());
      },
    );
  }
}
