import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreDetail extends StatefulWidget {
  final String text;
  final int score;
  final Color color;
  final bool highlight;
  const ScoreDetail(this.text, this.score, this.color, this.highlight,
      {Key? key})
      : super(key: key);

  @override
  State<ScoreDetail> createState() => _ScoreDetailState();
}

class _ScoreDetailState extends State<ScoreDetail> {
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero,
        () => {
              setState(() {
                _score = widget.score;
              })
            });
    return Container(
      height: 42,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: widget.color),
            child: Center(
              child: widget.score == -1
                  ? Text('TBD',
                      style: GoogleFonts.ubuntu(
                        color: Theme.of(context).backgroundColor,
                      ))
                  : Text('${_score}',
                      style: GoogleFonts.ubuntu(
                        color: Theme.of(context).backgroundColor,
                      )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                style: GoogleFonts.ubuntu(
                    color: widget.highlight
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight:
                        widget.highlight ? FontWeight.w600 : FontWeight.normal),
              ),
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                    height: 10,
                    width: widget.score == -1 ? 0 : 180 / 100 * _score,
                    decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

// class ScoreDetail extends StatelessWidget {
//   final String text;
//   final int score;
//   final Color color;
//   final bool highlight;
//   const ScoreDetail(this.text, this.score, this.color, this.highlight,
//       {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 42,
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 36,
//             height: 36,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), color: color),
//             child: Center(
//               child: score == -1
//                   ? Text('TBD',
//                       style: GoogleFonts.ubuntu(
//                         color: Theme.of(context).backgroundColor,
//                       ))
//                   : Text('$score',
//                       style: GoogleFonts.ubuntu(
//                         color: Theme.of(context).backgroundColor,
//                       )),
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 text,
//                 style: GoogleFonts.ubuntu(
//                     color: highlight
//                         ? Colors.white
//                         : Theme.of(context).primaryColor,
//                     fontSize: 16,
//                     fontWeight:
//                         highlight ? FontWeight.w600 : FontWeight.normal),
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     height: 10,
//                     width: 180,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).accentColor,
//                         borderRadius: BorderRadius.circular(5)),
//                   ),
//                   AnimatedContainer(
//                     duration: Duration(milliseconds: 1000),
//                     height: 10,
//                     width: 180 / 100 * score,
//                     decoration: BoxDecoration(
//                         color: color, borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
