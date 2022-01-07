import 'package:flutter/material.dart';
import '../../models/game.dart';

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
            maxHeight: 170.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 15,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    games[index].image,
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    games[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              );
            },
            itemCount: games.length,
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
