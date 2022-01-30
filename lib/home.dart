import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:should_i_watch_it/search.dart';
import 'package:should_i_watch_it/searchResult.dart';
import 'package:should_i_watch_it/searchResultData.dart';
import 'package:should_i_watch_it/searchResultSkeleton.dart';
import 'package:should_i_watch_it/settings.dart';
import 'package:should_i_watch_it/title.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SearchResultData> _searchResults = [];
  bool _loading = false;
  String search = '';

  openSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  onSearch(String searchText) async {
    if (search == searchText) return;
    setState(() {
      search = searchText;
      _loading = true;
    });
    if (searchText == '') {
      setState(() {
        _searchResults = [];
        _loading = false;
        return;
      });
    }
    http.Response response = await http
        .get(Uri.parse('http://168.119.116.61:8888/search/${searchText}'));
    if (response.statusCode == 200) {
      setState(() {
        List data = json.decode(response.body);
        _searchResults = data.map((e) => SearchResultData.fromJson(e)).toList();
        _loading = false;
      });
      print(_searchResults.length);
    }
  }

  Widget resultBuilder(BuildContext context, int index) {
    return SearchResult(_searchResults[index].title, _searchResults[index].year,
        _searchResults[index].imageUrl, _searchResults[index].movieName);
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
                            ? SearchResultSkeleton()
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
