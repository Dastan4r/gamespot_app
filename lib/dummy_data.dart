import '../../models/game.dart';
import '../../models/category.dart';
import '../../models/recomended_game.dart';

class DummyData {
  final List<Game> preorderGames = [
    Game(image: 'assets/images/death-door-game.png', name: 'Death`s Door'),
    Game(image: 'assets/images/dying-light-game.png', name: 'Dying Light 2'),
    Game(image: 'assets/images/death-door-game.png', name: 'Death`s Door'),
    Game(image: 'assets/images/dying-light-game.png', name: 'Dying Light 2'),
  ];

  final List<Game> popularGames = [
    Game(image: 'assets/images/death-loop-game.png', name: 'Deathloop'),
    Game(image: 'assets/images/far-cry-game.png', name: 'Farcry 6'),
    Game(image: 'assets/images/death-loop-game.png', name: 'Deathloop'),
    Game(image: 'assets/images/far-cry-game.png', name: 'Farcry 6'),
  ];

  final List<Category> popularCategories = [
    Category(image: 'assets/images/fantasy.png', title: 'Fantasy'),
    Category(image: 'assets/images/fantasy.png', title: 'Fantasy'),
    Category(image: 'assets/images/fantasy.png', title: 'Fantasy'),
    Category(image: 'assets/images/fantasy.png', title: 'Fantasy'),
  ];

  final List<Category> popularCollections = [
    Category(image: 'assets/images/classic-bg.png', title: 'Classics'),
    Category(image: 'assets/images/original-bg.png', title: 'Originals'),
    Category(image: 'assets/images/classic-bg.png', title: 'Classics'),
    Category(image: 'assets/images/original-bg.png', title: 'Originals'),
  ];

  final List<Game> recentlyUpdatedGames = [
    Game(image: 'assets/images/squadrons-game.png', name: 'SW: Squadrons'),
    Game(image: 'assets/images/hitman-game.png', name: 'Hitman 3'),
    Game(image: 'assets/images/squadrons-game.png', name: 'SW: Squadrons'),
    Game(image: 'assets/images/hitman-game.png', name: 'Hitman 3'),
  ];

  final List<Game> mostPopularGames = [
    Game(image: 'assets/images/back-blood-game.png', name: 'Back for Blood'),
    Game(image: 'assets/images/spider-man-game.png', name: 'Spider-man'),
    Game(image: 'assets/images/back-blood-game.png', name: 'Back for Blood'),
    Game(image: 'assets/images/spider-man-game.png', name: 'Spider-man'),
  ];

  final List<Game> playWithFriendsGames = [
    Game(image: 'assets/images/fifa-game.png', name: 'Fifa 22'),
    Game(image: 'assets/images/takes-two-game.png', name: 'It Takes Two'),
    Game(image: 'assets/images/fifa-game.png', name: 'Fifa 22'),
    Game(image: 'assets/images/takes-two-game.png', name: 'It Takes Two'),
  ];

  final List<RecomendedGame> recomendedGames = [
    RecomendedGame(
      image: 'assets/images/recomended-fifa-game.png',
      title: 'FIFA 22',
      description: 'An easy game to help you relax and unwind after a hard day.',
      logo: 'assets/images/ea-logo.png',
    ),
    RecomendedGame(
      image: 'assets/images/recomended-fifa-game.png',
      title: 'FIFA 22',
      description: 'An easy game to help you relax and unwind after a hard day.',
      logo: 'assets/images/ea-logo.png',
    ),
    RecomendedGame(
      image: 'assets/images/recomended-fifa-game.png',
      title: 'FIFA 22',
      description: 'An easy game to help you relax and unwind after a hard day.',
      logo: 'assets/images/ea-logo.png',
    ),
    RecomendedGame(
      image: 'assets/images/recomended-fifa-game.png',
      title: 'FIFA 22',
      description: 'An easy game to help you relax and unwind after a hard day.',
      logo: 'assets/images/ea-logo.png',
    ),
  ];
}