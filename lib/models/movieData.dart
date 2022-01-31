class MovieData {
  final String title;
  final String url;
  final int year;
  final String movieName;
  final String imageUrl;

  MovieData(this.title, this.url, this.year, this.movieName, this.imageUrl);

  MovieData.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        year = json['year'],
        movieName = json['movieName'],
        imageUrl = json['imageUrl'];
}
