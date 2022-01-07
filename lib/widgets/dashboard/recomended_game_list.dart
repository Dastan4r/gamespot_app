import 'package:flutter/material.dart';

import '../../models/recomended_game.dart';

class RecomendedGameListWidget extends StatelessWidget {
  final List<RecomendedGame> recomendedGames;

  const RecomendedGameListWidget({Key? key, required this.recomendedGames})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 340.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width / 1.5,
                padding: const EdgeInsets.only(
                  top: 17,
                  left: 20,
                  right: 20,
                  bottom: 27,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(52, 63, 92, 1),
                ),
                child: Column(
                  children: [
                    Image.asset(recomendedGames[index].logo),
                    Image.asset(recomendedGames[index].image),
                    Text(
                      recomendedGames[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      recomendedGames[index].description,
                      style: const TextStyle(
                        color: Color.fromRGBO(235, 235, 245, 1),
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
            itemCount: recomendedGames.length,
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
