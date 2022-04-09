import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:should_i_watch_it/api/api.dart';
import 'package:should_i_watch_it/models/reviewData.dart';
import 'package:should_i_watch_it/widgets/reviewHint.dart';
import 'package:should_i_watch_it/widgets/reviewSkeleton.dart';
import 'package:should_i_watch_it/widgets/score.dart';
import 'package:should_i_watch_it/models/movieData.dart';

class Review extends StatefulWidget {
  final MovieData movieData;
  Review(this.movieData);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  late ReviewData reviewData;
  bool loading = true;

  @override
  initState() {
    super.initState();
    fetchReview();
  }

  fetchReview() async {
    ReviewData data =
        await getReview(widget.movieData.type, widget.movieData.movieName);
    setState(() {
      reviewData = data;
      loading = false;
    });
  }

  closeReview() {
    Navigator.pop(context);
  }

  openReviewHint() {
    showDialog(context: context, builder: (context) => ReviewHint());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  padding: EdgeInsets.all(20),
                  child: IconButton(
                    onPressed: openReviewHint,
                    icon: Icon(Icons.info),
                    color: Theme.of(context).primaryColor,
                    iconSize: 28,
                  ),
                ),
              ],
            ),
            loading
                ? ReviewSkeleton()
                : Container(
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
                                      image: NetworkImage(reviewData.imageUrl),
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
                                    '${reviewData.title}',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 28),
                                    overflow: TextOverflow.visible,
                                  ),
                                  Text(
                                    '${reviewData.year}',
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
                              height: 60,
                            ),
                            Score(widget.movieData.type,
                                widget.movieData.movieName),
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
