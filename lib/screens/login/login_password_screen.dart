import 'package:flutter/material.dart';

import '../../widgets/app/app-button.dart';
import '../../screens/dashboard/dashboard.dart';
import '../../widgets/app/custom_app_bar.dart';

class LoginPasswordScreen extends StatelessWidget {
  static const routeName = 'LoginPasswordScreen';

  const LoginPasswordScreen();

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
              'Welcome back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Theme.of(context).textTheme.headline1!.color,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Please enter your password to complete log in.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const _LoginPasswordForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginPasswordForm extends StatefulWidget {
  const _LoginPasswordForm({Key? key}) : super(key: key);

  @override
  __LoginPasswordFormState createState() => __LoginPasswordFormState();
}

class __LoginPasswordFormState extends State<_LoginPasswordForm> {
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: _passwordController,
              autofocus: false,
              obscureText: true,
              maxLength: 16,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(118, 118, 128, 1),
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
                hintStyle: const TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(235, 235, 245, 1),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              cursorColor: Theme.of(context).textTheme.headline1!.color,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            AppButton(
              pressHandler: () {
                Navigator.of(context).pushNamedAndRemoveUntil(DashboardScreen.routeName, (Route<dynamic> route) => false);
              },
              type: 'light',
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
