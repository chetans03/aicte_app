import 'dart:convert';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<dynamic> finaldata = [];

  void explore() async {
    var res;
    try {
      res = await http.get(Uri.parse(
          "https://aicte-curriculum-portal.onrender.com/api/v1/explore/get-other-curriculums"));
    } catch (e) {
      print(res.statusCode);
      print(e.toString());
    }

    print(res.statusCode);
    var data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      setState(() {
        finaldata = data["data"];
      });
      print("fetched successfull");
      print(finaldata);
    } else {
      print(res.statusCode);
      print(data["message"]);
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    // final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(uri)) {
      throw "cannot launch url";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    explore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 130, 230),
        toolbarHeight: 80,
        title: const Text(
          "Explore",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView.builder(
              itemCount: finaldata.length,
              itemBuilder: (context, index) {
                if (finaldata.isEmpty) {
                  return Center(
                    child: SpinKitCircle(color: Colors.black),
                  );
                } else {
                  return Card(
                    elevation: 20,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Name : " + finaldata[index]["courseName"],
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Institute Name : " +
                                finaldata[index]["instituteName"],
                            style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 61, 103, 240),
                            ),
                          ),
                          Text(
                            "Level : " + finaldata[index]["level"],
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Program : " + finaldata[index]["program"],
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                _launchUrl("https://pub.dev/");
                              },
                              child: Text("Tap to rediret"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      Color.fromARGB(255, 90, 230, 255)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              })),
    );
  }
}
