import 'package:flutter/material.dart';

import '../../widgets/app/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        withoutBackButton: false,
        alignLeft: true,
      ),
      body: Text('Settings'),
    );
  }
}
