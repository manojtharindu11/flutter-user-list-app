import 'package:flutter/material.dart';
import 'package:hello_world_flutter/model/user.dart';
import 'package:hello_world_flutter/services/user_api.dart';

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
      appBar: AppBar(title: const Text("Users List")),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // final color = user.gender == 'male' ? Colors.blue : Colors.pink;
            return ListTile(
              leading: CircleAvatar(
                radius: 30, // Adjust the size of the thumbnail
                backgroundImage: NetworkImage(user.picture.thumbnail),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.email),
              // tileColor: color,
            );
          }),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
