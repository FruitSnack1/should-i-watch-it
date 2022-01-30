import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:should_i_watch_it/search.dart';
import 'package:should_i_watch_it/searchResult.dart';
import 'package:should_i_watch_it/searchResultData.dart';
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

  openSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  onSearch(String searchText) async {
    _loading = true;
    http.Response response = await http
        .get(Uri.parse('http://168.119.116.61:8888/search/${searchText}'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      setState(() {
        _searchResults = data.map((e) => SearchResultData.fromJson(e)).toList();
        _loading = false;
      });
      print(_searchResults);
    }
  }

  Widget resultBuilder(BuildContext context, int index) {
    return SearchResult(_searchResults[index].title, _searchResults[index].year,
        _searchResults[index].imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
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
                  Container(
                    width: 600,
                    height: 300,
                    child: _loading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: _searchResults.length,
                            itemBuilder: resultBuilder,
                          ),
                  ),
                ],
              ),
            ),
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
        ),
      ),
    );
  }
}
