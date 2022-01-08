import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app/custom_app_bar.dart';
import '../../widgets/login/login_form.dart';

import '../../store/authentication.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';

 const SignupScreen({Key? key}) : super(key: key);

  applySignupForm (String email, String password, BuildContext ctx) {
    Provider.of<Authentication>(ctx, listen: false).signup(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(
        title: 'Signup',
        withoutBackButton: false,
        alignLeft: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please fill form to create a free account!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 15),
            LoginForm(
              applyForm: applySignupForm,
              withPhoneButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
