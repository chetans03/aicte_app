import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var searchValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 390,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Curriculums",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
