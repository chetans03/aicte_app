import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectScreen extends StatefulWidget {
  SelectScreen({super.key, this.selectedTopics, required this.alltopics});
  List<String>? selectedTopics;
  final List alltopics;
  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int? selectedIndex;
  int oth = 0;
  int? colindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 54, 165, 255),
        toolbarHeight: 80,
        title: Column(children: [
          Text("Select topics",
              style: GoogleFonts.oswald(
                  fontSize: 25, color: const Color.fromARGB(255, 0, 0, 0))),
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(children: [
          // Text(
          //   "Topics Selected:   " + widget.selectedTopics.toString(),
          //   style: GoogleFonts.lato(fontSize: 17, color: Colors.red),
          // ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.alltopics.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Card(
                    elevation: 20,
                    child: Column(
                      children: [
                        Text(
                            widget.alltopics[index]["title"]
                                .toString()
                                .toUpperCase(),
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 0, 0, 0))),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.alltopics[index]["topics"].length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;

                                    if (widget.selectedTopics!.contains(
                                        widget.alltopics[selectedIndex!]
                                            ["topics"][i])) {
                                      widget.alltopics.add(
                                          widget.alltopics[selectedIndex!]
                                              ["topics"][i]);
                                      widget.alltopics.add("  ||  ");
                                    }

                                    if (!widget.selectedTopics!.contains(
                                        widget.alltopics[index]["topics"][i])) {
                                      widget.selectedTopics!.add(
                                          widget.alltopics[index]["topics"][i]);
                                    }
                                  });
                                },
                                tileColor: widget.selectedTopics == null
                                    ? Colors.amber
                                    : widget.selectedTopics!.contains(widget
                                            .alltopics[index]["topics"][i])
                                        ? Colors.red
                                        : Colors.amberAccent,
                                splashColor: Colors.black,
                                title: Text(
                                    " # " +
                                        widget.alltopics[index]["topics"][i],
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
                print(widget.selectedTopics);
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
