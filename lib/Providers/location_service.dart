import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService with ChangeNotifier {
  GoogleMapController _controller;
  static LatLng _initialPosition;
  LatLng _currentPosition;
  List<Placemark> _address;

  LatLng get currentLocation => _currentPosition;
  List<Placemark> get address => _address;
  GoogleMapController get mapController => _controller;

  LocationService() {
    getUserLocation();
  }

  getUserLocation() async {
    try {
      var geolocator = Geolocator();
      Position positon = await geolocator.getCurrentPosition();
      _currentPosition = LatLng(positon.latitude, positon.longitude);
      if (_currentPosition != null) {
        List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
            _currentPosition.latitude, _currentPosition.longitude);
        _address = placemark;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }



  Future<void> goToLocation() async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        zoom: 15)));
  }

  onCreated(GoogleMapController controller) {
    _controller = controller;
    notifyListeners();
  }

  onCameraMove(CameraPosition position) {
    _currentPosition = position.target;
  }
}
