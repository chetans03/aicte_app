import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 9, 130, 230),
          toolbarHeight: 80,
          title: const Text(
            "Your Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(children: [
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
                    "Proffesor name",
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                  subtitle: Text(
                    "946-3797",
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
                    "Designation",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Institute",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Specialization",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Professor",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "IIT-Delhi",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Computer Engineering",
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
            onPressed: () {},
            child: Text("Log out"),
            style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Color.fromARGB(255, 255, 44, 44),
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                fixedSize: Size(150, 50)),
          )
        ]),
      ),
    );
  }
}
