import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:sept_b2_flutter/state_mngt_provider/model/movie.dart';

final List<Movie> movielist = List.generate(
    100,
        (index) => Movie(
        title: "Movie$index", time: "${Random().nextInt(100) + 60}minutes"));

class MovieProvider extends ChangeNotifier {
  final List<Movie> _movies = movielist;
  List<Movie> get movies=>_movies; //getter to access list of movies

  final List<Movie> _wishlist = [];
  List<Movie> get wishlist=>_wishlist;

  void add_wishlist(Movie selectedmovie) {
    wishlist.add(selectedmovie);
    notifyListeners();

  }

  void remove_wishlist(Movie selectedmovie) {
    wishlist.remove(selectedmovie);
    notifyListeners();
  }


}