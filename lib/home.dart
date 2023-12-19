import 'package:aicte/screens/explore.dart';
import 'package:aicte/screens/feedback.dart';
import 'package:aicte/screens/notification.dart';
import 'package:aicte/screens/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  List pages = const [Feedbacks(), Explore(), Notifications(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            elevation: 20,
            indicatorColor: Color.fromARGB(255, 6, 6, 6),
            selectedIndex: currentPageIndex,
            onDestinationSelected: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.feedback,
                    color: Colors.blue,
                  ),
                  icon: Icon(Icons.feedback),
                  label: "Feedback"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.explore,
                    color: Colors.blue,
                  ),
                  icon: Icon(Icons.explore),
                  label: "Explore"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                  icon: Icon(Icons.notifications),
                  label: "Notifications"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  icon: Icon(Icons.person),
                  label: "Profile"),
            ]),
        body: pages[currentPageIndex]);
  }
}
