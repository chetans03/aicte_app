import 'dart:convert';

import 'package:aicte/home.dart';
import 'package:aicte/screens/veficationscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedprefs();
  }

  void initSharedprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool _isHidden = true;
  bool isloading = false;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final _formkey = GlobalKey<FormState>();
  var id = "";
  var password = "";

  void onLogin() async {
    var validated = _formkey.currentState!.validate();

    if (validated) {
      _formkey.currentState!.save();
    } else {
      return;
    }

    var body = {"userId": id, "password": password};
    var databody = json.encode(body);
    var res;
    try {
      setState(() {
        isloading = true;
      });
      res = await http.post(
        Uri.parse(
            "https://aicte-curriculum-portal.onrender.com/api/v1/auth/login-developer"),
        headers: {"Content-Type": "application/json"},
        body: databody,
      );
      print("id is" + id + password);
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print("Error Occured " + e.toString());
    }
    var data = jsonDecode(res.body);
    var message = data["status"];
    // print(res.statusCode);
    if (res.statusCode == 200) {
      // var token = res.headers;
      // final tokendata = token.firstWhere((cookie) => cookie.name == 'token');
      print(data["status"]);
      final id = data["user"]["_id"];
      final role = data["user"]["role"];
      final name = data["user"]["name"];
      final email = data["user"]["email"];
      print(res.headers.containsKey('set-cookie'));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => MyHomePage(
            email: email,
            name: name,
            role: role,
            id: id,
          ),
        ),
      );
      String cookieHeader = res.headers['set-cookie']!;
      List<String> cookies = cookieHeader.split(';');
      String token = '';
      for (String cookie in cookies) {
        if (cookie.trim().startsWith('token=')) {
          token = cookie.trim().substring('token='.length);
          break;
        }
      }
      print('Token: $token');
      prefs.setString('token', token);
      prefs.setString('email', email);
      prefs.setString('name', name);
      prefs.setString('role', role);
      prefs.setString('id', data["user"]["_id"]);
    } else {
      ScaffoldMessenger.maybeOf(context)!.showSnackBar(SnackBar(
          content: Text("Something went wrong or the user may not exist")));
      setState(() {
        isloading = false;
      });
      print(res.statusCode);

      print(data["message"]);
    }
    ScaffoldMessenger.maybeOf(context)!
        .showSnackBar(SnackBar(content: Text("Logged in successfully")));
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 130, 230),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  "images/aicte.png",
                ),
              ),
              const Text(
                "AICTE Feedback App",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Login",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Faculty ID",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text("Faculty ID"),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().length < 0) {
                      return "Please enter the correct ID";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    id = newValue!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: TextFormField(
                  obscureText: _isHidden ? false : true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text("Password"),
                    contentPadding: EdgeInsets.all(20),
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().length < 0) {
                      return "Please enter correct password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isloading
                      ? const SpinKitCircle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 50,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(200, 40),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                          onPressed: onLogin,
                          child: const Text("Login"),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => VerificationScreen(),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
