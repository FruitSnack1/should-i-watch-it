import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:should_i_watch_it/models/movieData.dart';

class Movie extends StatefulWidget {
  final MovieData movieData;
  final Function(MovieData movieData) cb;
  Movie(this.movieData, this.cb);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  // openReview() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               Review(widget.movieData, ReviewData(3, 3.3, 3, 3, 's'))));
  // }

  @override
  Widget build(BuildContext context) {
    final type = widget.movieData.type == 'tv' ? 'TV show' : 'Movie';
    return GestureDetector(
      onTap: () => widget.cb(widget.movieData),
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
                      image: NetworkImage(widget.movieData.imageUrl),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.movieData.title}',
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$type, ${widget.movieData.year}',
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
