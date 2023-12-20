import 'dart:convert';
import 'dart:io';

import 'package:aicte/screens/selectScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  double currentvalue1 = 0;
  double currentvalue2 = 0;
  double currentvalue3 = 0;
  Color buttoncolor = Colors.white;
  var colorcode = 0;
  TextEditingController controllerQ4 = TextEditingController();
  var q4 = "";
  var q6 = "";
  var YN = 0;
  bool isloading = false;
  TextEditingController controllerQ6 = TextEditingController();
  var Url = "https://aicte-curriculum-portal.onrender.com/api/v1/feedback/form";
  List<String> selectedTopics = [];

  void onSubmit() async {
    var res;

    try {
      print("inside tyr");
      setState(() {
        isloading = true;
      });
      // print(answersJson);
      res = await http.post(
        Uri.parse(
            "https://aicte-curriculum-portal.onrender.com/api/v1/feedback/form"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "subjectId": "6571569328735d1182d280dd",
          "by": "6571569328735d1182d280dd",
          "isStudent": true.toString(),
          "answers": [
            {"questionNo": 1, "questionType": "rate", "value": currentvalue1},
            {"questionNo": 2, "questionType": "rate", "value": currentvalue2},
            {"questionNo": 3, "questionType": "true/false", "value": YN},
            {"questionNo": 4, "questionType": "descriptive", "value": q4},
            {"questionNo": 5, "questionType": "rate", "value": currentvalue3},
            {"questionNo": 6, "questionType": "descriptive", "value": q6},
            {"questionNo": 7, "questionType": "select", "value": selectedTopics}
          ]
        }),
      );
    } catch (e) {
      print("Exception occurred: " + e.toString());
    }

    var data = jsonDecode(res.body);

    if (res.statusCode == 201) {
      print("Sent successfully and statuscode is " + res.statusCode.toString());
      print(data["message"]);
      Navigator.pop(context);
      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
          const SnackBar(content: Text("Feedback submitted successfully")));
      // selectedTopics = [];
      // Handle the response data here
    } else {
      print("Failed");
    }
    setState(() {
      isloading = false;
    });
    print(" q1" + currentvalue1.toString());
    print("q2" + currentvalue2.toString());
    print("tf" + YN.toString());
    print("q5" + currentvalue3.toString());
    print("q4" + q4);
    print("q6" + q6);
    print(selectedTopics);

    // try {
    //   print("inside tye");
    //   Response response = await dio.post(
    //       "https://aicte-curriculum-portal.onrender.com/api/v1/feedback/form",
    //       // options: Options(
    //       //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
    //       // ),
    //       data: {
    //         "subjectId": "6571569328735d1182d280dd",
    //         "by": "6571569328735d1182d280dd",
    //         "isStudent": true.toString(),
    //         "answers": [
    //           {"questionNo": 1, "questionType": "rate", "value": 4},
    //           {"questionNo": 2, "questionType": "rate", "value": 3},
    //           {"questionNo": 3, "questionType": "true/false", "value": 1},
    //           {"questionNo": 4, "questionType": "descriptive", "value": "Good"},
    //           {"questionNo": 5, "questionType": "rate", "value": 4},
    //           {
    //             "questionNo": 6,
    //             "questionType": "descriptive",
    //             "value": "Programming concepts"
    //           },
    //           {"questionNo": 7, "questionType": "select", "value": "Select"}
    //         ]
    //       });

    // print(response.statusCode);
    // var data = (response.headers);
    // if (response.statusCode == 200) {
    //   print("Sent successfully");
    //   print(data);
    //   print(response.data); // Handle the response data here
    // } else {
    //   print("Failed");
    // }
    // } catch (e) {
    //   print("Exception occurred: $e");
    //   // Handle DioError and other exceptions here
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 206, 246),
        title: const Text("Feedback Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.oswald(
                          fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Faculty Id",
                      style: GoogleFonts.oswald(
                          fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Professor",
                      style: GoogleFonts.oswald(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 5, 50, 87)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "IIT-Delhi",
                      style: GoogleFonts.oswald(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 5, 50, 87)),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Q1. How would you rate the difficulty level of the curriculum on a scale of 1-5 ?",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                  Center(
                    child: Text(currentvalue1.toString()),
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: currentvalue1.toString(),
                    value: currentvalue1,
                    onChanged: (val) {
                      setState(
                        () {
                          currentvalue1 = val;
                          print(currentvalue1);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      style: GoogleFonts.rubik(fontSize: 15),
                      "Q2. How would you rate the difficulty level of the curriculum on a scale of 1-5 ?"),
                  Center(
                    child: Text(currentvalue2.toString()),
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: currentvalue2.toString(),
                    value: currentvalue2,
                    onChanged: (val) {
                      setState(
                        () {
                          currentvalue2 = val;
                          print(currentvalue2);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      style: GoogleFonts.rubik(fontSize: 15),
                      "Q3. Do you think that the course work equips you with industry relevant skills?"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            YN = 1;
                            colorcode = 1;
                          });
                        },
                        child: const Text("Yes"),
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                colorcode == 1 ? Colors.blue : Colors.white,
                            foregroundColor: Colors.black),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            YN = 0;
                            colorcode = 2;
                          });
                        },
                        child: const Text("No"),
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                colorcode == 2 ? Colors.blue : Colors.white,
                            foregroundColor: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      style: GoogleFonts.rubik(fontSize: 15),
                      "Q4. What are your thoughts about the time duration allocated for the completion of syllabus?"),
                  TextField(
                    controller: controllerQ4,
                    textCapitalization: TextCapitalization.sentences,
                    scrollPhysics: const AlwaysScrollableScrollPhysics(),
                    scribbleEnabled: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      style: GoogleFonts.rubik(fontSize: 15),
                      "Q5. How would you rate the difficulty level of the curriculum on a scale of 1-5 ?"),
                  Center(
                    child: Text(currentvalue3.toString()),
                  ),
                  Slider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: currentvalue3.toString(),
                    value: currentvalue3,
                    onChanged: (val) {
                      setState(
                        () {
                          currentvalue3 = val;
                        },
                      );
                    },
                  ),
                  Text(
                      style: GoogleFonts.rubik(fontSize: 15),
                      "Q6. Is there any topic you want to include in the subject?"),
                  TextField(
                    controller: controllerQ6,
                    textCapitalization: TextCapitalization.sentences,
                    scrollPhysics: const AlwaysScrollableScrollPhysics(),
                    scribbleEnabled: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      style: GoogleFonts.rubik(fontSize: 15),
                      "Q7. Is there any topic you want to remove from the subject?"),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectScreen(selectedTopics: selectedTopics),
                          ),
                        );
                        print(selectedTopics);
                      },
                      child: Text("Select topic"),
                      style: TextButton.styleFrom(
                          fixedSize: const Size(150, 20),
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isloading
                      ? const SpinKitCircle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 70,
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              setState(() {
                                q4 = controllerQ4.text;
                                q6 = controllerQ6.text;
                              });
                            });
                            // print(currentvalue1);
                            // print(currentvalue2);
                            // print(YN);
                            // print(q4);
                            // print(currentvalue3);
                            // print(q6);
                            onSubmit();
                          },
                          child: Text(
                            "Submit Feedback",
                            style: GoogleFonts.lato(fontSize: 20),
                          ),
                          style: TextButton.styleFrom(
                              fixedSize: const Size(20, 20),
                              foregroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              backgroundColor: Color.fromARGB(255, 8, 155, 13)),
                        ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
