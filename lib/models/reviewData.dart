class ReviewData {
  final int criticScore;
  final double userScore;
  final int criticCount;
  final int userCount;
  final String imageUrl;
  final bool rated = true;

  ReviewData(this.criticScore, this.userScore, this.criticCount, this.userCount,
      this.imageUrl);

  ReviewData.fromJson(Map<String, dynamic> json)
      : criticScore = json['criticScore'],
        userScore = json['userScore'].toDouble(),
        criticCount = json['criticCount'],
        userCount = json['userCount'],
        imageUrl = '';
}
