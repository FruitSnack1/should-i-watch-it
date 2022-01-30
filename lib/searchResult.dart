import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResult extends StatefulWidget {
  final String title;
  final int year;
  final String imageUrl;
  SearchResult(this.title, this.year, this.imageUrl);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(widget.imageUrl), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.title}',
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${widget.year}',
                  style: GoogleFonts.ubuntu(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
