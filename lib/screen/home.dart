import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world_flutter/model/user.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("REST API CALL")),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final color = user.gender == 'male' ? Colors.blue : Colors.pink;
            return ListTile(
              title: Text(user.name.first),
              subtitle: Text(user.phone),
              // tileColor: color,
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    print("fetchUsers called.");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((user) {
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
    setState(() {
      users = transformed;
    });
    print("fetchedUsers completed.");
  }
}
