import 'dart:convert';
import 'package:hello_world_flutter/model/user_dob.dart';
import 'package:hello_world_flutter/model/user_location.dart';
import 'package:http/http.dart' as http;
import 'package:hello_world_flutter/model/user.dart';
import 'package:hello_world_flutter/model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print("fetchUsers called.");

    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((user) {
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

      return User(
          cell: user['cell'],
          email: user['email'],
          phone: user['phone'],
          gender: user['gender'],
          name: name,
          nat: user['nat'],
          dob: dob,
          location: location);
    }).toList();

    print("fetchedUsers completed.");

    return users;
  }
}
