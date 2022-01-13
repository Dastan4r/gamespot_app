import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login/login_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/login/signup_screen.dart';
import 'screens/cart/cart.dart';
import 'screens/favorite/favorite.dart';
import 'screens/settings/settings.dart';
import 'screens/game_detail/game_detail.dart';

import 'store/authentication.dart';
import 'store/games.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
        ChangeNotifierProvider.value(
          value: GamesStore(),
        ),
      ],
      child: Consumer<Authentication>(
        builder: (ctx, auth, _) {
          return MaterialApp(
            key: Key('auth_${auth.isAuthenticated}'),
            theme: ThemeData(
              primaryColor: Colors.black,
              backgroundColor: Colors.black,
              textTheme: const TextTheme(
                headline1: TextStyle(color: Colors.white),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: auth.isAuthenticated
                ? const DashboardScreen()
                : const LoginScreen(),
            routes: {
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              DashboardScreen.routeName: (ctx) => const DashboardScreen(),
              SignupScreen.routeName: (ctx) => const SignupScreen(),
              CartScreen.routeName: (ctx) => const CartScreen(),
              SettingsScreen.routeName: (ctx) => const SettingsScreen(),
              FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
              GameDetailScreen.routeName: (ctx) => const GameDetailScreen(),
            },
          );
        },
      ),
    );
  }
}
