import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:should_i_watch_it/api/api.dart';
import 'package:should_i_watch_it/models/reviewData.dart';
import 'package:should_i_watch_it/widgets/scoreDetail.dart';

class Score extends StatefulWidget {
  final String movieName;
  const Score(this.movieName);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  String text = '';
  Color color = Color.fromARGB(0, 0, 0, 0);
  bool loading = true;
  late ReviewData reviewData;
  late int movieScore;

  @override
  initState() {
    super.initState();
    fetchScore();
  }

  String getText(int score) {
    List<String> texts = [
      'DEFINITELY YES',
      'PROBABLY YES',
      'EHH..',
      'PROBABLY NO',
      'DEFINITELY NO',
      'NO RATING YET'
    ];
    if (score >= 81) return texts[0];
    if (score >= 61) return texts[1];
    if (score >= 40) return texts[2];
    if (score >= 20) return texts[3];
    if (score >= 0) return texts[4];
    return texts[5];
  }

  Color getColor(int score) {
    List<Color> colors = [
      Colors.green,
      Colors.yellow,
      Colors.red,
      Color.fromARGB(255, 174, 174, 174)
    ];
    if (score >= 61) return colors[0];
    if (score >= 40) return colors[1];
    if (score >= 0) return colors[2];
    return colors[3];
  }

  fetchScore() async {
    ReviewData data = await getReview(widget.movieName);
    int score = await data.getScore();
    Future.delayed(
        const Duration(milliseconds: 3000),
        () => {
              setState(() {
                movieScore = score;
                reviewData = data;
                text = getText(score);
                color = getColor(score);
                loading = false;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Column(
            children: [
              Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Calculating score ...',
                style:
                    GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
              )
            ],
          )
        : Column(
            children: [
              Text(
                text,
                style: GoogleFonts.bebasNeue(fontSize: 58, color: color),
              ),
              SizedBox(height: 5),
              reviewData.criticScore == -1
                  ? Text('')
                  : Text(
                      'Based on ${reviewData.criticCount} critics and ${reviewData.userCount} users',
                      style: GoogleFonts.ubuntu(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                    ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScoreDetail('Critic score', reviewData.criticScore.toInt(),
                      getColor(reviewData.criticScore.toInt()), false),
                  ScoreDetail('User score', (reviewData.userScore * 10).toInt(),
                      getColor((reviewData.userScore * 10).toInt()), false),
                  ScoreDetail(
                      'Overall score', movieScore, getColor(movieScore), true)
                ],
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       width: 42,
              //       height: 42,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(50),
              //           color: getColor(movieScore)),
              //       child: Center(
              //         child: reviewData.criticScore == -1
              //             ? Text('TBD',
              //                 style: GoogleFonts.ubuntu(
              //                   color: Theme.of(context).backgroundColor,
              //                 ))
              //             : Text('$movieScore',
              //                 style: GoogleFonts.ubuntu(
              //                   color: Theme.of(context).backgroundColor,
              //                 )),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Text(
              //       'Overall score',
              //       style: GoogleFonts.ubuntu(color: Colors.white),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       width: 42,
              //       height: 42,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5),
              //           color: getColor(reviewData.criticScore)),
              //       child: Center(
              //         child: reviewData.criticScore == -1
              //             ? Text('TBD',
              //                 style: GoogleFonts.ubuntu(
              //                   color: Theme.of(context).backgroundColor,
              //                 ))
              //             : Text('${reviewData.criticScore}',
              //                 style: GoogleFonts.ubuntu(
              //                   color: Theme.of(context).backgroundColor,
              //                 )),
              //       ),
              //     ),
              //     Container(
              //       width: 42,
              //       height: 42,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5),
              //           color: getColor((reviewData.userScore * 10).round())),
              //       child: Center(
              //         child: Text('${(reviewData.userScore * 10).round()}',
              //             style: GoogleFonts.ubuntu(
              //               color: Theme.of(context).backgroundColor,
              //             )),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       'Critic score',
              //       style: GoogleFonts.ubuntu(
              //           color: Theme.of(context).primaryColor, fontSize: 12),
              //     ),
              //     Text('User score',
              //         style: GoogleFonts.ubuntu(
              //             color: Theme.of(context).primaryColor, fontSize: 12)),
              //   ],
              // )
            ],
          );
  }
}
