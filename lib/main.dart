import 'package:flutter/material.dart';
import 'package:movie_list/screens/movie_list_screen.dart';
import 'package:movie_list/screens/wrapper.dart';
import 'package:movie_list/view_model/movie_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MovieListViewModel())
        ],
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Movie list'),
            ),
            body: Center(
              child: WrapperWidget(),
            ),
          ),
        ));
  }
}
