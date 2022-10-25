import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

  Future<void> fetchMovies(String? searchString) async {
    Logger.log("fetching movies...");
    Uri uri = Uri.parse(Constants.getAPIURL());

    if (searchString?.isNotEmpty ?? false) {
      uri = Uri.parse(Constants.getAPIURL(searchTerm: searchString ?? ""));
    }
    Logger.log("url ${uri.toString()}");

    try {
      dynamic response = await get(uri);
      var dictionary = jsonDecode(response.body);
      movieList = MovieModel.fromJson(dictionary);
    } catch (e) {
      movieList = [];
      Logger.log("Exception ${e.toString()}");
    }
    isLoading = false;
  }
}
