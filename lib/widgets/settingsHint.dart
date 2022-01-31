import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsHint extends StatelessWidget {
  const SettingsHint({Key? key}) : super(key: key);

  openGitHub() {
    launch('https://github.com/FruitSnack1');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      content: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Movie rating is calculated from both ',
                    style: GoogleFonts.ubuntu(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                    children: [
                  TextSpan(
                    text: 'critic score ',
                    style: GoogleFonts.ubuntu(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'and ',
                  ),
                  TextSpan(
                    text: 'user score',
                    style: GoogleFonts.ubuntu(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        '. You can choose, how much will each score effect overall rating.',
                  ),
                ])),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Examples ',
                style: GoogleFonts.ubuntu(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Critic score only :',
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/critics.png'),
              )),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '50/50 :',
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/50.png'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
