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
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  e.poster,
                  errorBuilder: (a, b, c) {
                    return Text(b.toString());
                  },
                ),
              ),
            );
          }).toList(),
        )),

        // GridView(
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //       crossAxisSpacing: 8, maxCrossAxisExtent: double.maxFinite),
        //   children: widget.model
        //       .map(
        //         (e) => ConstrainedBox(
        //             constraints: BoxConstraints(
        //                 maxHeight: double.infinity, maxWidth: double.infinity),
        //             child: ListView(
        //               children: [
        //                 Image.network(e.poster, errorBuilder: (a, b, c) {
        //                   return Center(child: Text(b.toString()));
        //                 }),
        //                 Text(e.year)
        //               ],
        //             )),
        //       )
        //       .toList(),
        // )

        // GridView.count(
        //   crossAxisCount: 2,
        //   children: widget.model
        //       .map(
        //         (e) => Column(
        //             // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        //             children: [
        //               FittedBox(
        //                 fit: BoxFit.fill,
        //                 child:
        //                     Image.network(e.poster, errorBuilder: (a, b, c) {
        //                   return Center(child: Text(b.toString()));
        //                 }),
        //               ),
        //               Text(e.title),
        //               Text(e.year)
        //             ]),
        //       )
        //       .toList(),
        // ),
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
