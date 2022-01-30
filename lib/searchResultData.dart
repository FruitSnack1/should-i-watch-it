class SearchResultData {
  final String title;
  final String url;
  final int year;
  final String movieName;
  final String imageUrl;

  SearchResultData(
      this.title, this.url, this.year, this.movieName, this.imageUrl);

  SearchResultData.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        url = json['url'],
        year = json['year'],
        movieName = json['movieName'],
        imageUrl = json['imageUrl'];
}
