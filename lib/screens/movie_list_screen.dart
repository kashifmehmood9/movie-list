import 'package:flutter/material.dart';
import 'package:movie_list/screens/movie_list_details_screen.dart';
import '../view_model/movie_list_view_model.dart';

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key, required this.viewModel}) : super(key: key);
  MovieListViewModel viewModel;

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  late ScrollController controller;
  String? searchString;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getMovies(searchString, 1);
      }
    });
  }

  void getMovies(String? searchString, int page) async {
    await widget.viewModel.fetchMovies(searchString, page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(hintText: "Enter movie name"),
          onChanged: (value) {
            widget.viewModel.reset();
            searchString = value;
            getMovies(value, 0);
          },
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Expanded(
          child: GridView.builder(
              controller: controller,
              itemCount: widget.viewModel.movieList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieListDetailsWidget(
                                movie: widget.viewModel.movieList[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      widget.viewModel.movieList[index].poster,
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) {
                        return Icon(Icons.broken_image);
                      },
                    ),
                  ),
                );
              }))
    ]);
  }
}
