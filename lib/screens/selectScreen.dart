import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectScreen extends StatefulWidget {
  SelectScreen({super.key, this.selectedTopics});
  List<String>? selectedTopics;

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<String> topics = ["oops", "dsa", "cn", "dbms"];
  List<dynamic> dummydata = [
    {
      "common_id": "654289191876",
      "credits": 5,
      "title": "Object Oriented Porgramming",
      "modules": [
        {
          "title": "chapter_1",
          "topics": [
            "topic1ch1",
            "topic2ch1",
            "topic3ch1",
            "topic4ch1",
          ],
        },
        {
          "title": "chapter3",
          "topics": ["topic1ch2", "topic2ch2", "topic3ch2", "topic4ch2"],
        },
        {
          "title": "Chapter4",
          "topics": ["topic1ch4", "topic2ch4", "topic3ch4", "topic4ch4"]
        }
      ]
    }
  ];
  List<dynamic> module = [];
  int? selectedIndex;
  int oth = 0;
  int? colindex;
  @override
  Widget build(BuildContext context) {
    module = dummydata[0]["modules"];
    print(module[0]["topics"].length);
    print(module);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 54, 165, 255),
        toolbarHeight: 80,
        title: Column(children: [
          Text("Select topics",
              style: GoogleFonts.oswald(
                  fontSize: 25, color: const Color.fromARGB(255, 0, 0, 0))),
          Text(dummydata[0]["title"])
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(children: [
          Text(
            "Topics Selected:   " +
                widget.selectedTopics.toString().toUpperCase(),
            style: GoogleFonts.lato(fontSize: 17, color: Colors.red),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: module.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Text(module[index]["title"].toString().toUpperCase(),
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: module[index]["topics"].length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;

                                    if (!widget.selectedTopics!.contains(
                                        module[selectedIndex!]["topics"][i])) {
                                      widget.selectedTopics!.add(
                                          module[selectedIndex!]["topics"][i]);
                                    }
                                  });
                                },
                                splashColor: Colors.black,
                                title: Text(module[index]["topics"][i],
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 0, 40, 202))),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.grey),
              child: Text("Done")),
          const SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }
}
