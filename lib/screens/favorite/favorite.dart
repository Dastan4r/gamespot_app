import 'package:flutter/material.dart';

import '../../widgets/app/custom_app_bar.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Favorite',
        withoutBackButton: false,
        alignLeft: true,
      ),
      body: Text('Favorite'),
    );
  }
}
