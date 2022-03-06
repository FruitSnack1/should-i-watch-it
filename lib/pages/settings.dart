import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:should_i_watch_it/widgets/about.dart';
import 'package:should_i_watch_it/widgets/settingsHint.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double criticWeight = 5;
  double userWeight = 5;

  @override
  initState() {
    super.initState();
    loadWeights();
  }

  loadWeights() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble('criticWeight') == null ||
        prefs.getDouble('userWeight') == null) return;
    setState(() {
      criticWeight = prefs.getDouble('criticWeight') as double;
      userWeight = prefs.getDouble('userWeight') as double;
    });
  }

  closeSettings() {
    Navigator.pop(context);
  }

  onCriticWeightChange(value) {
    setState(() {
      criticWeight = value;
      userWeight = 10 - criticWeight;
      saveWeights();
    });
  }

  onUserWeightChange(value) {
    setState(() {
      userWeight = value;
      criticWeight = 10 - userWeight;
      saveWeights();
    });
  }

  saveWeights() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('userWeight', userWeight);
    prefs.setDouble('criticWeight', criticWeight);
  }

  showAbout() {
    showDialog(context: context, builder: (context) => About());
  }

  showSettingsHint() {
    showDialog(context: context, builder: (context) => SettingsHint());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Stack(
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
                  WeightSlider('Critic reviews weight', criticWeight,
                      onCriticWeightChange),
                  SizedBox(
                    height: 20,
                  ),
                  WeightSlider(
                      'User reviews weight', userWeight, onUserWeightChange),
                  TextButton(
                      onPressed: showSettingsHint,
                      child: Text(
                        'What is this ?',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 12),
                      )),
                  SizedBox(
                    height: 60,
                  ),
                  TextButton(
                      onPressed: showAbout,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                      ),
                      child: Text(
                        'About',
                        style: GoogleFonts.ubuntu(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeightSlider extends StatefulWidget {
  final double value;
  final String name;
  final Function(double) cb;
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
              '${widget.value.floor()}',
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
