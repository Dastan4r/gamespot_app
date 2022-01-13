import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/game.dart';
import '../models/game_detail.dart';

class GamesStore with ChangeNotifier {
  List<Game> _topGamesList = [];
  List<Game> _preorderGamesList = [];

  GameDetailModel? _currentGame;

  get topGamesList {
    return [..._topGamesList];
  }

  get preorderGamesList {
    return [..._preorderGamesList];
  }

  get getCurrentGame {
    return _currentGame;
  }

  Future<void> getTopGamesList() async {
    try {
      final url = Uri.parse(
        'https://api.rawg.io/api/games?key=bc6af68897534358b5aec1e1b6475f82&page_size=10',
      );

      http.Response response = await http.get(url);
      final responseData = json.decode(response.body);
      final loadedResults = responseData['results'] as List;

      final List<Game> loadedGames = [];

      for (var item in loadedResults) {
        loadedGames.add(
          Game(
            image: item['background_image'],
            name: item['name'],
            id: item['id'],
          ),
        );
      }

      _topGamesList = loadedGames;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future<void> getCurrentGameDetails(int gameId) async {
    try {
      final url = Uri.parse(
        'https://api.rawg.io/api/games/$gameId?key=bc6af68897534358b5aec1e1b6475f82',
      );

      http.Response response = await http.get(url);
      final responseData = json.decode(response.body);
      final responsePlatforms = responseData["platforms"] as List;

      List<String> availablePlatforms = [];

      for (var element in responsePlatforms) {
        availablePlatforms.add(element['platform']['name']);
      }

      final screenshotsUrl = Uri.parse(
        'https://api.rawg.io/api/games/$gameId/screenshots?key=bc6af68897534358b5aec1e1b6475f82&page_size=10',
      );

      http.Response screenshotResponse = await http.get(screenshotsUrl);
      final screenshotResponseDecode = json.decode(screenshotResponse.body);
      final screenshotsDecoded = screenshotResponseDecode['results'] as List;

      List<String> availableScreenshots = [];

      for (var element in screenshotsDecoded) {
        availableScreenshots.add(element['image']);
      }

      // final trailerUrl = Uri.parse(
      //   'https://api.rawg.io/api/games/$gameId/movies?key=bc6af68897534358b5aec1e1b6475f82&page_size=1',
      // );

      // http.Response trailerResponse = await http.get(trailerUrl);
      // final trailerResponseDecode = json.decode(trailerResponse.body);
      // final trailerDecoded = trailerResponseDecode['results'];

      GameDetailModel newGame = GameDetailModel(
        id: responseData['id'],
        name: responseData['name'],
        description: responseData['description'],
        screenshots: availableScreenshots,
        metacriticRating: responseData['metacritic'],
        availablePlatforms: availablePlatforms,
        image: responseData['background_image'],
      );

      _currentGame = newGame;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

    Future<void> getPreorderGames() async {
    try {
      final url = Uri.parse(
        'https://api.rawg.io/api/games?key=bc6af68897534358b5aec1e1b6475f82&page_size=10&dates=2022-01-15,2022-12-31',
      );

      http.Response response = await http.get(url);
      final responseData = json.decode(response.body);
      final loadedResults = responseData['results'] as List;

      final List<Game> loadedGames = [];

      for (var item in loadedResults) {
        loadedGames.add(
          Game(
            image: item['background_image'],
            name: item['name'],
            id: item['id'],
          ),
        );
      }

      _preorderGamesList = loadedGames;

      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
