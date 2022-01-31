import 'package:shared_preferences/shared_preferences.dart';

class ReviewData {
  final int criticScore;
  final double userScore;
  final int criticCount;
  final int userCount;
  final String imageUrl;
  final String title;
  final String year;

  ReviewData(this.criticScore, this.userScore, this.criticCount, this.userCount,
      this.imageUrl, this.year, this.title);

  ReviewData.fromJson(Map<String, dynamic> json)
      : criticScore = json['criticScore'],
        userScore = json['userScore'].toDouble(),
        criticCount = json['criticCount'],
        userCount = json['userCount'],
        imageUrl = json['imageUrl'],
        title = json['title'],
        year = json['year'];

  Future<int> getScore() async {
    if (criticScore == -1) return -1;
    final prefs = await SharedPreferences.getInstance();
    int critic = (criticScore * prefs.getDouble('criticWeight')!).round();
    int user = (userScore * 10 * prefs.getDouble('userWeight')!).round();
    return ((user + critic) / 10).round();
  }
}
