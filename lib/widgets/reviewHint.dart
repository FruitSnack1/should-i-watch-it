import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewHint extends StatelessWidget {
  const ReviewHint({Key? key}) : super(key: key);

  openGitHub() {
    launch('https://github.com/FruitSnack1');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      content: IntrinsicHeight(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '81 - 100',
                  style:
                      GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
                ),
                Text(
                  'DEFINITELY YES',
                  style:
                      GoogleFonts.bebasNeue(color: Colors.green, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '61 - 80',
                  style:
                      GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
                ),
                Text(
                  'PROBABLY YES',
                  style:
                      GoogleFonts.bebasNeue(color: Colors.green, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '40 - 60',
                  style:
                      GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
                ),
                Text(
                  'EHH..',
                  style:
                      GoogleFonts.bebasNeue(color: Colors.yellow, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '20 - 39',
                  style:
                      GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
                ),
                Text(
                  'PROBABLY NO',
                  style: GoogleFonts.bebasNeue(color: Colors.red, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0 - 19',
                  style:
                      GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
                ),
                Text(
                  'DEFINITELY NO',
                  style: GoogleFonts.bebasNeue(color: Colors.red, fontSize: 24),
                ),
              ],
            ),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Text(
        //           '81 - 100',
        //           style:
        //               GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
        //         ),
        //         Text(
        //           '61 - 80',
        //           style:
        //               GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
        //         ),
        //         Text(
        //           '40 - 60',
        //           style:
        //               GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
        //         ),
        //         Text(
        //           '20 - 39',
        //           style:
        //               GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
        //         ),
        //         Text(
        //           '0 - 19',
        //           style:
        //               GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
        //         ),
        //       ],
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Text(
        //           'DEFINITELY YES',
        //           style:
        //               GoogleFonts.bebasNeue(color: Colors.green, fontSize: 24),
        //         ),
        //         Text(
        //           'PROBABLY YES',
        //           style:
        //               GoogleFonts.bebasNeue(color: Colors.green, fontSize: 24),
        //         ),
        //         Text(
        //           'EHH..',
        //           style:
        //               GoogleFonts.bebasNeue(color: Colors.yellow, fontSize: 24),
        //         ),
        //         Text(
        //           'PROBABLY NO',
        //           style: GoogleFonts.bebasNeue(color: Colors.red, fontSize: 24),
        //         ),
        //         Text(
        //           'DEFINITELY NO',
        //           style: GoogleFonts.bebasNeue(color: Colors.red, fontSize: 24),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
