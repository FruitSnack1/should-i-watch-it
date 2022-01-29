import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SHOULD I WATCH IT ?',
            style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 36),
          ),
          Text(
            'An honest app about movies',
            style: GoogleFonts.bebasNeue(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
