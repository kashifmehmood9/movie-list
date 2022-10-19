class Search {
  String title, year, imdbID, type, poster;

  Search(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.type,
      required this.poster});

  Search fromJson(Map<String, dynamic> json) {
    return Search(
        title: json['title'],
        year: json['year'],
        imdbID: json['imdbID'],
        type: json['type'],
        poster: json['poster']);
  }
}
