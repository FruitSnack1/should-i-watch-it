import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double criticsWeight = 5;
  double usersWeight = 5;

  closeSettings() {
    Navigator.pop(context);
  }

  onCriticsWeightChange(value) {
    setState(() {
      criticsWeight = value;
      usersWeight = 10 - criticsWeight;
    });
  }

  onUsersWeightChange(value) {
    setState(() {
      usersWeight = value;
      criticsWeight = 10 - usersWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: IconButton(
              onPressed: closeSettings,
              icon: Icon(Icons.arrow_back),
              color: Theme.of(context).primaryColor,
              iconSize: 28,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeightSlider('Critics review weight', criticsWeight,
                    onCriticsWeightChange),
                WeightSlider(
                    'Users review weight', usersWeight, onUsersWeightChange),
                Text('$criticsWeight $usersWeight')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WeightSlider extends StatefulWidget {
  double value;
  String name;
  Function(double) cb;
  WeightSlider(this.name, this.value, this.cb);

  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.name}',
              style: GoogleFonts.ubuntu(color: Theme.of(context).primaryColor),
            ),
            Text(
              '${widget.value}',
              style: GoogleFonts.ubuntu(color: Colors.white),
            ),
          ],
        ),
        Slider(
          value: widget.value,
          onChanged: (value) {
            widget.cb(value);
          },
          activeColor: Colors.white,
          inactiveColor: Theme.of(context).primaryColor,
          min: 0,
          max: 10,
          divisions: 10,
        ),
      ],
    );
  }
}
