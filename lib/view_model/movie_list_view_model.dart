import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movie_list/Constants.dart';
import 'package:movie_list/helper/logger.dart';
import 'package:movie_list/models/search_model.dart';
import 'package:http/http.dart';

class MovieListViewModel extends ChangeNotifier {
  late List<MovieModel> movieList;
  bool isLoading = true;
  int page = 1;
  MovieListViewModel() {
    movieList = [];
  }

  Future<void> fetchMovies(String? searchString, int page) async {
    Logger.log("fetching movies...");
    print("This.page ${this.page} + Page: ${page}");

    if (page == 0) {
      this.page = 1;
    }

    int pagination = this.page + page;
    this.page = pagination;
    Uri uri = Uri.parse(Constants.getAPIURL(page: pagination));
    print(pagination);
    if (searchString?.isNotEmpty ?? false) {
      uri = Uri.parse(Constants.getAPIURL(
          searchTerm: searchString ?? "", page: pagination));
    }
    Logger.log("url ${uri.toString()}");

    try {
      dynamic response = await get(uri);
      var dictionary = jsonDecode(response.body);
      var list = MovieModel.fromJson(dictionary);
      movieList.addAll(list);
    } catch (e) {
      Logger.log("Exception ${e.toString()}");
    }
    isLoading = false;
    notifyListeners();
  }

  void reset() {
    page = 1;
    movieList = [];
  }
}
