import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 130, 230),
        toolbarHeight: 80,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [
          ListTile(
            tileColor: Color.fromARGB(255, 225, 236, 244),
            leading: Icon(Icons.notification_important),
            title: Text("Education policy updated"),
            subtitle: Text(
              "2days ago",
              style: TextStyle(color: Color.fromARGB(255, 106, 153, 192)),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Color.fromARGB(255, 225, 236, 244),
            leading: Icon(Icons.notification_important),
            title: Text("Education policy updated"),
            subtitle: Text(
              "2days ago",
              style: TextStyle(color: Color.fromARGB(255, 106, 153, 192)),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Color.fromARGB(255, 225, 236, 244),
            leading: Icon(Icons.notification_important),
            title: Text("Education policy updated"),
            subtitle: Text(
              "2days ago",
              style: TextStyle(color: Color.fromARGB(255, 106, 153, 192)),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Color.fromARGB(255, 225, 236, 244),
            leading: Icon(Icons.notification_important),
            title: Text("Education policy updated"),
            subtitle: Text(
              "2days ago",
              style: TextStyle(color: Color.fromARGB(255, 106, 153, 192)),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            tileColor: Color.fromARGB(255, 225, 236, 244),
            leading: Icon(Icons.notification_important),
            title: Text("Education policy updated"),
            subtitle: Text(
              "2days ago",
              style: TextStyle(color: Color.fromARGB(255, 106, 153, 192)),
            ),
          ),
        ],
      ),
    );
  }
}
