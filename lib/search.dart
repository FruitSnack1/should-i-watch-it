import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextField(
        style: GoogleFonts.ubuntu(color: Colors.white),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 174, 174, 174),
              ),
              onPressed: () {},
            ),
            hintText: 'Search for a movie ...',
            hintStyle:
                GoogleFonts.ubuntu(color: Color.fromARGB(255, 174, 174, 174)),
            filled: true,
            fillColor: Color.fromARGB(255, 59, 59, 59)),
      )),
    );
  }
}
