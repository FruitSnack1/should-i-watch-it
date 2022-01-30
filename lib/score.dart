import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Score extends StatefulWidget {
  final String movieName;
  const Score(this.movieName);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  String text = '';
  Color color = Color.fromARGB(0, 0, 0, 0);
  int score = 0;
  bool loading = true;

  @override
  initState() {
    super.initState();
    getScore();
  }

  String getText(int score) {
    List<String> texts = [
      'DEFINITELY YES',
      'PROBABLY YES',
      'EHH..',
      'PROBABLY NO',
      'DEFINITELY NO'
    ];
    if (score >= 81) return texts[0];
    if (score >= 61) return texts[1];
    if (score >= 40) return texts[2];
    if (score >= 20) return texts[3];
    return texts[4];
  }

  Color getColor(int score) {
    List<Color> colors = [Colors.green, Colors.yellow, Colors.red];
    if (score >= 61) return colors[0];
    if (score >= 40) return colors[1];
    return colors[2];
  }

  getScore() async {
    http.Response response = await http
        .get(Uri.parse('http://168.119.116.61:8888/score/${widget.movieName}'));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      if (json.decode(response.body)['criticScore'] == null) {
        setState(() {
          text = 'NO RATING YET';
          color = Color.fromARGB(255, 174, 174, 174);
          loading = false;
        });
        return;
      }
      int critic = (json.decode(response.body)['criticScore'] *
              prefs.getDouble('criticWeight'))
          .round();
      int user = (json.decode(response.body)['userScore'] *
              10 *
              prefs.getDouble('userWeight'))
          .round();
      score = ((user + critic) / 10).round();
      print('critic : $critic, user: $user, score: $score');
      setState(() {
        text = getText(score);
        color = getColor(score);
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading
            ? Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              )
            : Text(
                text,
                style: GoogleFonts.bebasNeue(fontSize: 72, color: color),
              ),
        SizedBox(height: 20),
        Text(
          'Based on 34 critics and 1388 users ...',
          style: GoogleFonts.ubuntu(
              fontSize: 12, color: Theme.of(context).primaryColor),
        )
      ],
    );
    ;
  }
}
