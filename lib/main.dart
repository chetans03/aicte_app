import 'package:aicte/home.dart';
import 'package:aicte/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: prefs.getString('token'),
    email: prefs.getString('email'),
    role: prefs.getString('role'),
    id: prefs.getString('id'),
    name: prefs.getString('name'),
  ));
}

class MyApp extends StatelessWidget {
  var token;
  var email;
  var role;
  var name;
  var id;
  MyApp({
    required this.token,
    required this.email,
    required this.role,
    required this.name,
    required this.id,
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: token == null
          ? Login()
          : MyHomePage(email: email, name: name, role: role, id: id),
    );
  }
}
