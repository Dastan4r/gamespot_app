import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/dashboard/dashboard.dart';

import '../../widgets/app/custom_app_bar.dart';
import '../../widgets/app/app-button.dart';
import '../../store/authentication.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Map<String, dynamic> formData = {'email': null, 'password': null};

  final _formKey = GlobalKey<FormState>();
  final focusPassword = FocusNode();

  void _submitForm(ctx) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Provider.of<Authentication>(context, listen: false)
          .signup(formData['email'], formData['password'])
          .then(
            (value) => Navigator.of(ctx).pushNamedAndRemoveUntil(
              DashboardScreen.routeName,
              (Route<dynamic> route) => false,
            ),
          );
    }
  }

  @override
  void dispose() {
    focusPassword.dispose();
    super.dispose();
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
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    const Text(
                      'Please fill form to create free account!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
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
                      validator: (String? value) {
                        if (value != null && value.isNotEmpty) {
                          if (!RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                            return 'This is not a valid email';
                          }
                        }
                      },
                      cursorColor: Theme.of(context).textTheme.headline1!.color,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? value) {
                        formData['email'] = value;
                      },
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusPassword);
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      focusNode: focusPassword,
                      autofocus: false,
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
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length <= 5) {
                          return 'Invalid password';
                        }
                      },
                      onSaved: (String? value) {
                        formData['password'] = value;
                      },
                      onFieldSubmitted: (String? value) {
                        _submitForm(context);
                      },
                      cursorColor: Theme.of(context).textTheme.headline1!.color,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              AppButton(
                pressHandler: () {
                  _submitForm(context);
                },
                type: 'light',
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
