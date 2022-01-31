import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Build version:',
                  style: GoogleFonts.ubuntu(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
                Text(
                  '0.9.0',
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Made by',
                style: GoogleFonts.ubuntu(
                    color: Theme.of(context).primaryColor, fontSize: 14)),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: openGitHub,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/github.png'))),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '@fruitsnack1',
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
