import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../widgets/app/custom_app_bar.dart';
import '../../widgets/app/app-button.dart';

import '../../store/games.dart';

class GameDetailScreen extends StatefulWidget {
  static const routeName = '/game-details';

  const GameDetailScreen({Key? key}) : super(key: key);

  @override
  _GameDetailScreenState createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    int gameId = ModalRoute.of(context)!.settings.arguments as int;
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<GamesStore>(context).getCurrentGameDetails(gameId).then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }

    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final currentGame = Provider.of<GamesStore>(context).getCurrentGame;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Game Details',
        withoutBackButton: false,
        alignLeft: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: (isLoading || currentGame == null)
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        currentGame.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          currentGame.image,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 100.0,
                        ),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (ctx, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                currentGame.screenshots[index],
                                width: MediaQuery.of(context).size.width / 3,
                                height: 100,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 100,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          itemCount: currentGame.screenshots.length,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Metacritic rating',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${currentGame.metacriticRating}/100',
                            style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Html(
                        data: currentGame.description,
                        style: {
                          'p': Style(
                            color: Colors.white,
                            fontSize: const FontSize(14),
                          ),
                        },
                      ),
                      const SizedBox(height: 15),
                      AppButton(
                        pressHandler: () {},
                        type: 'light',
                        title: 'Add to favorite',
                      ),
                      const SizedBox(height: 15),
                      AppButton(
                        pressHandler: () {},
                        type: 'light',
                        title: 'Add to cart',
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
