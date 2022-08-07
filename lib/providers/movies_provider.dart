import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'd6a7b4f3f264762ec0b4258791bcd6d4';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResposnse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResposnse.results;
    notifyListeners(); // Redibuja la data
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners(); // Redibuja la data
  }
}
