import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:should_i_watch_it/search.dart';
import 'package:should_i_watch_it/searchResult.dart';
import 'package:should_i_watch_it/settings.dart';
import 'package:should_i_watch_it/title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  openSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(),
                SizedBox(height: 60),
                Search(),
                SizedBox(height: 20),
                SearchResult(),
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
    );
  }
}
