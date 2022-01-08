import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/game.dart';

class GamesStore with ChangeNotifier {
  List<Game> _topGamesList = [];

  get topGamesList {
    return [..._topGamesList];
  }

  Future<void> getTopGamesList() async {
    try {
      final url = Uri.parse(
        'https://api.rawg.io/api/games?key=bc6af68897534358b5aec1e1b6475f82&page_size=10',
      );

      final response = await http.get(url);
      final responseData = json.decode(response.body);
      final loadedResults = responseData['results'] as List;

      final List<Game> loadedGames = [];

      for (var item in loadedResults) {
        loadedGames.add(
          Game(
            image: item['background_image'],
            name: item['name'],
          ),
        );
      }

      _topGamesList = loadedGames;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
