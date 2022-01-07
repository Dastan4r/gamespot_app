import 'package:flutter/material.dart';

import '../login/signup_screen.dart';

import '../../widgets/login/login_form.dart';
import '../../widgets/app/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(
        title: 'GameSpot',
        withoutBackButton: true,
        alignLeft: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Theme.of(context).textTheme.headline1!.color,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text(
                  'Enter your email address to log in or',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignupScreen.routeName);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
