import 'package:flutter/material.dart';

import '../../screens/login/login_password_screen.dart';
import '../../widgets/app/app-button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
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
              controller: _controller,
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(118, 118, 128, 1),
                hintText: 'Email',
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
            const _ActionButtons()
          ],
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondButtonStyle = ElevatedButton.styleFrom(
      primary: const Color.fromRGBO(44, 44, 46, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );

    return Column(
      children: [
        AppButton(
          pressHandler: () {
            Navigator.of(context).pushNamed(LoginPasswordScreen.routeName);
          },
          title: 'Continue',
          type: 'light',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            children: const [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
         AppButton(
          pressHandler: () {
            Navigator.of(context).pushNamed(LoginPasswordScreen.routeName);
          },
          title: 'Continue with Phone',
          type: 'dark',
        ),
      ],
    );
  }
}
