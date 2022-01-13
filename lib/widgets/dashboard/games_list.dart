import 'package:flutter/material.dart';

import '../../models/game.dart';

import '../../screens/game_detail/game_detail.dart';

class GamesListWidget extends StatelessWidget {
  final List<Game> games;

  const GamesListWidget({
    Key? key,
    required this.games,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 140.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 15,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    GameDetailScreen.routeName,
                    arguments: games[index].id,
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        games[index].image,
                        width: MediaQuery.of(context).size.width / 2,
                        height: 110,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 110,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        games[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: games.length,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
