import 'package:flutter/material.dart';
import 'package:movie_list/screens/movie_list_screen.dart';
import 'package:movie_list/view_model/movie_list_view_model.dart';

class WrapperWidget extends StatefulWidget {
  @override
  State<WrapperWidget> createState() => _WrapperWidgetState();
}

class _WrapperWidgetState extends State<WrapperWidget> {
  MovieListViewModel viewModel = MovieListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.addListener(() {
      setState(() {});
    });
    _getMoviesList();
  }

  Future<void> _getMoviesList() async {
    await viewModel.fetchMovies(null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: viewModel.isLoading
            ? CircularProgressIndicator()
            : MovieListWidget(
                viewModel: viewModel,
              ));
  }
}
