import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:should_i_watch_it/api/api.dart';
import 'package:should_i_watch_it/models/movieData.dart';
import 'package:should_i_watch_it/models/reviewData.dart';
import 'package:should_i_watch_it/pages/review.dart';
import 'package:should_i_watch_it/pages/settings.dart';
import 'package:http/http.dart' as http;
import 'package:should_i_watch_it/widgets/search.dart';
import 'package:should_i_watch_it/widgets/movie.dart';
import 'package:should_i_watch_it/widgets/movieSkeleton.dart';
import 'package:should_i_watch_it/widgets/title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MovieData> _searchResults = [];
  bool _loading = false;
  String search = '';

  openSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  onSearch(String searchText) async {
    if (search == searchText) return;
    if (searchText == '') {
      setState(() {
        _searchResults = [];
        _loading = false;
        return;
      });
    }
    setState(() {
      search = searchText;
      _loading = true;
    });
    List<MovieData> result = await getMovies(searchText);
    setState(() {
      _searchResults = result;
      _loading = false;
    });
  }

  openReview(MovieData movieData) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Review(movieData)));
  }

  Widget resultBuilder(BuildContext context, int index) {
    return Movie(_searchResults[index], openReview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    TitleText(),
                    SizedBox(height: 20),
                    Search(onSearch),
                    SizedBox(height: 20),
                    Expanded(
                        child: _loading
                            ? MovieSkeleton()
                            : _searchResults.length == 0 && search != ''
                                ? Text(
                                    "Couldn't find a movie with that title",
                                    style: GoogleFonts.ubuntu(
                                        color: Theme.of(context).primaryColor),
                                  )
                                : ListView.builder(
                                    itemCount: _searchResults.length,
                                    itemBuilder: resultBuilder,
                                  )),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: IconButton(
                        onPressed: openSettings,
                        icon: Icon(
                          Icons.settings,
                          color: Theme.of(context).primaryColor,
                          size: 28,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
