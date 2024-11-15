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

    final dob = UserDob.fromMap(user['dob']);

    final picture = UserPicture.fromMap(user['picture']);

    final location = UserLocation.fromMap(user['location']);

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
