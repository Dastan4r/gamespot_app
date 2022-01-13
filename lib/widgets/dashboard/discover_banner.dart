import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../screens/game_detail/game_detail.dart';

import '../../store/games.dart';

class DiscoverBannerWidget extends StatefulWidget {
  const DiscoverBannerWidget({Key? key}) : super(key: key);

  @override
  State<DiscoverBannerWidget> createState() => DiscoverBannerWidgetState();
}

class DiscoverBannerWidgetState extends State<DiscoverBannerWidget> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<GamesStore>(context).getTopGamesList().then((_) {
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
    final _loadTopTenGames = Provider.of<GamesStore>(context).topGamesList;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 150.0,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, int index) => const SizedBox(
          width: 15,
        ),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(GameDetailScreen.routeName, arguments: _loadTopTenGames[index].id);
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _loadTopTenGames[index].image,
                    width: MediaQuery.of(context).size.width / 2,
                    height: 150,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 150,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 3,
                  left: 5,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: Text(
                      _loadTopTenGames[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: _loadTopTenGames.length,
      ),
    );
  }
}
