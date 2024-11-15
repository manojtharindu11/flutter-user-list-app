import 'package:hello_world_flutter/model/user_location/user_location_coordinate.dart';
import 'package:hello_world_flutter/model/user_location/user_location_street.dart';
import 'package:hello_world_flutter/model/user_location/user_location_timezone_coordinate.dart';

class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postCode;
  final LocationCoordinate coordinates;
  final LocationTimezoneCoordinate timezone;
  final LocationStreet street;

  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postCode,
      required this.coordinates,
      required this.timezone,
      required this.street});

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coordinates = LocationCoordinate.fromMap(json['coordinates']);
    final timezone = LocationTimezoneCoordinate.fromMap(json['timezone']);
    final street = LocationStreet.fromMap(json['street']);

    return UserLocation(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postCode: json['postCode'].toString(),
        coordinates: coordinates,
        timezone: timezone,
        street: street);
  }
}
