class Constants {
  static final _urlKey = "https://www.omdbapi.com/?s=";
  static final _pageKey = "&page=";
  static final _apiKey = "&apikey=fb70e03a";

  static String getAPIURL({int page = 0, String searchTerm = "movie"}) {
    return _urlKey + searchTerm + _pageKey + page.toString() + _apiKey;
  }
}
