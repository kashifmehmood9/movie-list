import 'package:movie_list/helper/logger.dart';

class MovieModel {
  String title, year, imdbID, type, poster;

  MovieModel(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.type,
      required this.poster});

  static List<MovieModel> fromJson(Map<dynamic, dynamic> json) {
    var search = json['Search'] as List;
    Logger.log("Total results: ${search.length}");
    return search.map((searchItem) {
      return MovieModel(
          title: searchItem['Title'],
          year: searchItem['Year'],
          imdbID: searchItem['imdbID'],
          type: searchItem['Type'],
          poster: searchItem['Poster']);
    }).toList();
  }
}
