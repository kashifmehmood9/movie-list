import 'dart:convert';

import 'package:movie_list/Constants.dart';
import 'package:movie_list/helper/logger.dart';
import 'package:movie_list/models/search_model.dart';
import 'package:http/http.dart';

class MovieListViewModel {
  late List<MovieModel> movieList;
  bool isLoading = true;

  MovieListViewModel() {
    movieList = [];
  }

  Future<void> fetchMovies() async {
    Logger.log("fetching movies...");
    dynamic response = await get(Uri.parse(Constants.APIUrl));
    Map dictionary = jsonDecode(response.body);
    movieList = MovieModel.fromJson(dictionary);
    isLoading = false;
  }
}
