import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login/login_screen.dart';
import 'screens/login/login_password_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/login/signup_screen.dart';

import 'store/authentication.dart';

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
      ],
      child: Consumer<Authentication>(
        builder: (ctx, auth, _) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.black,
              backgroundColor: Colors.black,
              textTheme: const TextTheme(
                headline1: TextStyle(color: Colors.white),
              ),
            ),
            debugShowCheckedModeBanner: false,
            routes: {
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              LoginPasswordScreen.routeName: (ctx) =>
                  const LoginPasswordScreen(),
              DashboardScreen.routeName: (ctx) => const DashboardScreen(),
              SignupScreen.routeName: (ctx) => const SignupScreen(),
            },
          );
        },
      ),
    );
  }
}
