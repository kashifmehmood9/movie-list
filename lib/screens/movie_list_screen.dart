import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:movie_list/models/search_model.dart';
import 'package:movie_list/view_model/movie_list_view_model.dart';

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key, required this.model}) : super(key: key);
  late List<MovieModel> model;

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  //model.map((e) => Text(e.title)).toList(),
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Enter movie name"),
            onChanged: (value) {
              print(value);
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

class Delegate extends SliverGridDelegate {
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    // TODO: implement getLayout
    throw UnimplementedError();
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    throw UnimplementedError();
  }
}
