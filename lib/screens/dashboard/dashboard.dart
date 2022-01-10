import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app/custom_app_bar.dart';
import '../../widgets/dashboard/search_form.dart';
import '../../widgets/dashboard/games_list.dart';
import '../../widgets/dashboard/category_title.dart';
import '../../widgets/dashboard/categories_list.dart';
import '../../widgets/dashboard/useful_link_list.dart';
import '../../widgets/dashboard/recomended_game_list.dart';
import '../../widgets/dashboard/discover_banner.dart';

import '../../models/game.dart';
import '../../models/category.dart';
import '../../models/recomended_game.dart';

import '../../store/games.dart';

final List<Game> preorderGames = [
  Game(image: 'assets/images/death-door-game.png', name: 'Death`s Door', id: 10),
  Game(image: 'assets/images/dying-light-game.png', name: 'Dying Light 2', id: 10),
  Game(image: 'assets/images/death-door-game.png', name: 'Death`s Door', id: 10),
  Game(image: 'assets/images/dying-light-game.png', name: 'Dying Light 2', id: 10),
];

final List<Game> popularGames = [
  Game(image: 'assets/images/death-loop-game.png', name: 'Deathloop', id: 10),
  Game(image: 'assets/images/far-cry-game.png', name: 'Farcry 6', id: 10),
  Game(image: 'assets/images/death-loop-game.png', name: 'Deathloop', id: 10),
  Game(image: 'assets/images/far-cry-game.png', name: 'Farcry 6', id: 10),
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
  Game(image: 'assets/images/squadrons-game.png', name: 'SW: Squadrons', id: 10),
  Game(image: 'assets/images/hitman-game.png', name: 'Hitman 3', id: 10),
  Game(image: 'assets/images/squadrons-game.png', name: 'SW: Squadrons', id: 10),
  Game(image: 'assets/images/hitman-game.png', name: 'Hitman 3', id: 10),
];

final List<Game> mostPopularGames = [
  Game(image: 'assets/images/back-blood-game.png', name: 'Back for Blood', id: 10),
  Game(image: 'assets/images/spider-man-game.png', name: 'Spider-man', id: 10),
  Game(image: 'assets/images/back-blood-game.png', name: 'Back for Blood', id: 10),
  Game(image: 'assets/images/spider-man-game.png', name: 'Spider-man', id: 10),
];

final List<Game> playWithFriendsGames = [
  Game(image: 'assets/images/fifa-game.png', name: 'Fifa 22', id: 10),
  Game(image: 'assets/images/takes-two-game.png', name: 'It Takes Two', id: 10),
  Game(image: 'assets/images/fifa-game.png', name: 'Fifa 22', id: 10),
  Game(image: 'assets/images/takes-two-game.png', name: 'It Takes Two', id: 10),
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

class DashboardScreen extends StatelessWidget {
  static const routeName = 'Dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Discover',
        withoutBackButton: true,
        alignLeft: false,
        withAction: true,
        largeFontSize: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SearchFormWidget(),
                const SizedBox(height: 20),
                const DiscoverBannerWidget(),
                const SizedBox(height: 20),
                const CategoryTitleWidget(
                  title: 'Pre-order',
                  link: 'See all',
                ),
                const SizedBox(
                  height: 6,
                ),
                GamesListWidget(games: preorderGames),
                const CategoryTitleWidget(
                  title: 'Popular',
                  link: 'See all',
                ),
                GamesListWidget(games: popularGames),
                const CategoryTitleWidget(title: 'Browse by category'),
                CategoriesListWidget(categories: popularCategories),
                const CategoryTitleWidget(title: 'You might like'),
                RecomendedGameListWidget(recomendedGames: recomendedGames),
                const CategoryTitleWidget(
                  title: 'Recently Updated',
                  link: 'See all',
                ),
                GamesListWidget(games: recentlyUpdatedGames),
                const CategoryTitleWidget(
                  title: 'Most Popular',
                  link: 'See all',
                ),
                GamesListWidget(games: mostPopularGames),
                const CategoryTitleWidget(title: 'Game collections'),
                CategoriesListWidget(categories: popularCollections),
                const CategoryTitleWidget(
                  title: 'Play with Friends',
                  link: 'See all',
                ),
                GamesListWidget(games: playWithFriendsGames),
                const CategoryTitleWidget(title: 'Useful links'),
                const UsefulLinksListWidget(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
