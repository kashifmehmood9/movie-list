import 'package:flutter/material.dart';
import 'package:movie_list/models/search_model.dart';
import 'package:movie_list/screens/wrapper.dart';

import '../main.dart';

class MovieListDetailsWidget extends StatefulWidget {
  MovieListDetailsWidget({required this.movie});
  late MovieModel movie;

  @override
  State<MovieListDetailsWidget> createState() => _MovieListDetailsWidgetState();
}

class _MovieListDetailsWidgetState extends State<MovieListDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
        title: Text(widget.movie.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              widget.movie.poster,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
              child: Text(
            widget.movie.title,
            style: TextStyle(
              fontSize: 28,
            ),
          )),
          SizedBox(
            height: 8.0,
          ),
          Center(
              child: Text(
            widget.movie.imdbID,
            style: TextStyle(fontSize: 18),
          )),
          SizedBox(
            height: 8.0,
          ),
          Center(
              child: Text(widget.movie.year, style: TextStyle(fontSize: 18))),
          SizedBox(
            height: 8.0,
          ),
          Center(
              child: Text(widget.movie.type, style: TextStyle(fontSize: 18))),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
