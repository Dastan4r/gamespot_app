import 'package:flutter/material.dart';

import '../../widgets/app/app-button.dart';

class LoginForm extends StatefulWidget {
  final bool withPhoneButton;
  final Function applyForm;

  const LoginForm({
    Key? key,
    this.withPhoneButton = true,
    required this.applyForm,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Map<String, dynamic> formData = {'email': null, 'password': null};

  final _formKey = GlobalKey<FormState>();
  final focusPassword = FocusNode();

  void _submitForm(ctx) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.applyForm(formData['email'], formData['password'], ctx);
    }
  }

  @override
  void dispose() {
    focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                children: [
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
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null || value.isEmpty || value.length <= 5) {
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
              title: 'Continue',
              type: 'light',
            ),
          ],
        ),
      ),
    );
  }
}
