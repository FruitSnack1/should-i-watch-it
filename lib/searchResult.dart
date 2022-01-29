import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage('joker.jpg'), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Joker, 2019',
            style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
