import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:should_i_watch_it/models/movieData.dart';
import 'package:should_i_watch_it/models/reviewData.dart';

// const API_URL = 'http://168.119.116.61:8888';
const API_URL = 'http://10.0.2.2:80';

Future<List<MovieData>> getMovies(String query) async {
  http.Response response = await http.get(Uri.parse('$API_URL/search/$query'));
  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((e) => MovieData.fromJson(e)).toList();
  } else
    return [];
}

Future<ReviewData> getReview(String type, String movieName) async {
  http.Response response =
      await http.get(Uri.parse('$API_URL/score/$type/$movieName'));
  return ReviewData.fromJson(json.decode(response.body));
}
