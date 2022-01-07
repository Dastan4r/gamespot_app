import 'package:flutter/material.dart';
import 'package:gamespot_app/screens/login/login_password_screen.dart';

import '../../screens/login/login_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool withoutBackButton;
  final bool alignLeft;
  final bool withAction;
  final bool largeFontSize;

  const CustomAppBar({
    required this.title,
    required this.withoutBackButton,
    this.alignLeft = false,
    this.withAction = false,
    this.largeFontSize = false,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: const Color.fromRGBO(0, 0, 0, 0),
    );

    return AppBar(
      automaticallyImplyLeading: !widget.withoutBackButton,
      backgroundColor: Colors.black,
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.largeFontSize ? 32 : 17,
        ),
      ),
      centerTitle: widget.alignLeft,
      actions: [
        if (widget.withAction)
          PopupMenuButton(
            padding: const EdgeInsets.all(0),
            offset: const Offset(0, 50),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Colors.black),
                    Text('Logout'),
                  ]
                ),
                value: 'logout',
              ),
            ],
             onSelected: (selectedValue) {
                if (selectedValue == 'logout') {
                   Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName, (Route<dynamic> route) => false);
                }
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
