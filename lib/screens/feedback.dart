import 'package:aicte/screens/feedbackform.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feedbacks extends StatelessWidget {
  const Feedbacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: ListView(
          children: [
            Text(
              "Your Subjects",
              style: GoogleFonts.oswald(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subject name",
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => FeedbackForm(),
                      ),
                    );
                  },
                  child: Text("Feedback"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 24, 146, 246),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subject name",
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Feedback"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 24, 146, 246),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
