import 'package:hello_world_flutter/model/user_dob.dart';
import 'package:hello_world_flutter/model/user_location.dart';
import 'package:hello_world_flutter/model/user_name.dart';
import 'package:hello_world_flutter/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.nat,
      required this.cell,
      required this.name,
      required this.dob,
      required this.location,
      required this.picture});

  factory User.fromMap(Map<String, dynamic> user) {
    final name = UserName(
        title: user['name']['title'],
        first: user['name']['first'],
        last: user['name']['last']);

    final date = user['dob']['date'];

    final dob = UserDob(date: DateTime.parse(date), age: user['dob']['age']);

    final coordinates = LocationCoordinates(
        latitude: user['location']['coordinates']['latitude'],
        longitude: user['location']['coordinates']['longitude']);

    final timezone = LocationTimezoneCoordinate(
        offset: user['location']['timezone']['offset'],
        description: user['location']['timezone']['description']);

    final street = LocationStreet(
        number: user['location']['street']['number'],
        name: user['location']['street']['name']);

    final location = UserLocation(
        city: user['location']['city'],
        state: user['location']['state'],
        country: user['location']['country'],
        postCode: user['location']['postCode'].toString(),
        coordinates: coordinates,
        timezone: timezone,
        street: street);

    final picture = UserPicture.fromMap(user['picture']);

    return User(
        cell: user['cell'],
        email: user['email'],
        phone: user['phone'],
        gender: user['gender'],
        name: name,
        nat: user['nat'],
        dob: dob,
        location: location,
        picture: picture);
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
