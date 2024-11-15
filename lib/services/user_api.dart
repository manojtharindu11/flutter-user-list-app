import 'dart:convert';
import 'package:hello_world_flutter/model/user_dob.dart';
import 'package:hello_world_flutter/model/user_location/user_location.dart';
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
      return User.fromMap(user);
    }).toList();

    print("fetchedUsers completed.");

    return users;
  }
}
