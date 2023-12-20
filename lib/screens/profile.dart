import 'package:aicte/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile(
      {super.key,
      required this.role,
      required this.email,
      required this.name,
      required this.id});
  final role;
  final email;
  final name;
  final id;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isloadig = false;
  void Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('email');
    prefs.remove('name');
    prefs.remove('id');
    prefs.remove('role');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 9, 130, 230),
        toolbarHeight: 80,
        title: const Text(
          "Your Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: ClipOval(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      "images/profile.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Proffesor ID",
                      style: GoogleFonts.lato(fontSize: 25),
                    ),
                    subtitle: Text(
                      widget.id,
                      style: GoogleFonts.rubik(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Role",
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.role.toString().toUpperCase(),
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.email,
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                      title: Text("Do you really wanna logout ?"),
                      actions: [
                        OutlinedButton(
                          onPressed: Logout,
                          child: Text("Yes"),
                        ),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"))
                      ]),
                );
              },
              child: Text("Log out"),
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Color.fromARGB(255, 255, 44, 44),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  fixedSize: Size(150, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
