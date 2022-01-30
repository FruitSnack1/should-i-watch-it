import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:should_i_watch_it/review.dart';

class SearchResult extends StatefulWidget {
  final String title;
  final int year;
  final String imageUrl;
  final String movieName;
  SearchResult(this.title, this.year, this.imageUrl, this.movieName);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  openReview() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Review(
                widget.title, widget.year, widget.imageUrl, widget.movieName)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openReview,
      child: Container(
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
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
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
      ),
    );
  }
}
