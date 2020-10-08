
import 'package:flutter_svg/flutter_svg.dart';

class Lawyer {
  
  double longitude;
  double latitude;
  String firstname;
  String lastname;
  bool onCall;
  String phone;
  double distance;

  Lawyer(
      {this.longitude,
      this.latitude,
      this.firstname,
      this.lastname,
      this.phone,
      this.onCall,
      this.distance});

  Lawyer.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    distance = json['distance'];
    onCall = json['on_call'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['distance'] = this.distance;
    return data;
  }
}