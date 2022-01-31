import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:should_i_watch_it/api/api.dart';
import 'package:should_i_watch_it/models/reviewData.dart';
import 'package:should_i_watch_it/widgets/score.dart';
import 'package:should_i_watch_it/models/movieData.dart';

class Review extends StatefulWidget {
  final MovieData movieData;
  Review(this.movieData);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  String largeImage = '';
  int review = 0;

  @override
  initState() {
    super.initState();
    fetchReview();
  }

  fetchReview() async {
    ReviewData data = await getReview(widget.movieData.movieName);
  }

  closeReview() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: IconButton(
                onPressed: closeReview,
                icon: Icon(Icons.arrow_back),
                color: Theme.of(context).primaryColor,
                iconSize: 28,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 180,
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
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white, fontSize: 28),
                              overflow: TextOverflow.visible,
                            ),
                            Text(
                              '${widget.movieData.year}',
                              style: GoogleFonts.ubuntu(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Score(widget.movieData.movieName),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
