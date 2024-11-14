import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hello_world_flutter/model/user.dart';
import 'package:hello_world_flutter/model/userName.dart';

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
      return User(
          cell: user['cell'],
          email: user['email'],
          phone: user['phone'],
          gender: user['gender'],
          name: name,
          nat: user['nat']);
    }).toList();

    print("fetchedUsers completed.");

    return users;
  }
}
