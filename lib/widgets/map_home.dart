import 'package:beep/Providers/location_service.dart';
import 'package:beep/Providers/ux_control_provider.dart';
import 'package:beep/utils/enums.dart';
import 'package:beep/widgets/more_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

const double ZOOM = 18;

class MapHome extends StatefulWidget {
  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  @override
  Widget build(BuildContext context) {
    var locationProv = Provider.of<LocationService>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: locationProv.currentLocation != null
                ? GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: locationProv.currentLocation, zoom: ZOOM),
                    onMapCreated: locationProv.onCreated,
                  )
                : Center(child: CircularProgressIndicator()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<UxControl>(builder: (context, control, _) {
              return SizedBox(
                width: 150.0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: control.currentPage != menu.navHomeWithSheet
                      ? RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.brown,
                          child: Text('SETUP BEEP',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                        )
                      : SizedBox(),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 37.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 385,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Current Location',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Nunito')),
                            Text(
                              '${locationProv.address != null ? locationProv.address[0].name : 'No Location'}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        child: Center(
                          child: Icon(
                            Icons.my_location,
                            color: Colors.brown,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.black26, width: 0.5),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Consumer<UxControl>(builder: (context, show, _) {
            return Container(
              color: Colors.transparent,
              child: show.currentPage == menu.navMenu ? TestPage() : SizedBox(),
            );
          })
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
