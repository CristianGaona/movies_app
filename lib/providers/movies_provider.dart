import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'API_KEY';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';
  MoviesProvider() {
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print("ENTRA ");
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    var response = await http.get(url);
    print(response.body);
  }
}
