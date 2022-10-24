import 'package:flutter/material.dart';
import 'package:movie_list/models/search_model.dart';

import '../view_model/movie_list_view_model.dart';

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key, required this.model, required this.viewModel})
      : super(key: key);
  late List<MovieModel> model;
  MovieListViewModel viewModel;

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  void getMovies(String? searchString) async {
    await widget.viewModel.fetchMovies(searchString);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Enter movie name"),
            onChanged: (value) {
              getMovies(value);
              setState(() {
                widget.model = widget.viewModel.movieList;
              });
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Flexible(
            child: GridView.count(
          crossAxisCount: 2,
          children: widget.model.map((e) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Image.network(
                e.poster,
                fit: BoxFit.fill,
                errorBuilder: (_, __, ___) {
                  return Icon(Icons.broken_image);
                },
              ),
            );
          }).toList(),
        )),
      ],
    );
  }
}
