import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  final Function(String) cb;
  final TextEditingController controller;
  Search(this.controller, this.cb);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  onSearch(searchText) {
    widget.cb(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextField(
        controller: widget.controller,
        onChanged: onSearch,
        style: GoogleFonts.ubuntu(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
            hintText: 'Search for a movie ...',
            hintStyle:
                GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
            filled: true,
            fillColor: Theme.of(context).accentColor),
      )),
    );
  }
}
