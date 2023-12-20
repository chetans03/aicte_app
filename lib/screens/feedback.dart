import 'dart:convert';

import 'package:aicte/screens/feedbackform.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Feedbacks extends StatefulWidget {
  Feedbacks({super.key});

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  @override
  var subjectdata = [];
  var subjectid;

  void getSubjects() async {
    var res;
    try {
      print("inside try");
      var res = await http.post(
        Uri.parse(
            "https://aicte-curriculum-portal.onrender.com/api/v1/subjects/for-user"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "user": {"_id": "6581d44a0c03ea66ae835465"}
          },
        ),
      );
      print("try completed");
      print(res.body);
      var data = jsonDecode(res.body);

      setState(() {
        subjectdata = data["data"];
        print(subjectdata);
      });
    } catch (e) {
      print("inside try");
      print("exception is" + e.toString());
    }
    // var data = jsonDecode(res.body);
    // print(res);
    // print(res.statusCode);
    // print(data.toString());

    // var data = jsonDecode(res.body);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 9, 130, 230),
        toolbarHeight: 80,
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(
                "images/aicte.png",
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "AICTE Mobile App",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            Text(
              "Your Subjects",
              style: GoogleFonts.oswald(fontSize: 25),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: subjectdata.length,
                  itemBuilder: (BuildContext, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          subjectdata[index]["title"].toString(),
                          style: GoogleFonts.roboto(fontSize: 15),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => FeedbackForm(
                                    subjectid: subjectdata[index]["_id"],
                                    selecttopics: subjectdata[index]
                                        ["modules"]),
                              ),
                            );
                          },
                          child: Text("Feedback"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 24, 146, 246),
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
// Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Subject name",
//                   style: GoogleFonts.roboto(fontSize: 15),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (ctx) => FeedbackForm(),
//                       ),
//                     );
//                   },
//                   child: Text("Feedback"),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: const Color.fromARGB(255, 24, 146, 246),
//                   ),
//                 ),
//               ],
//             ),