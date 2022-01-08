import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/cart/cart.dart';
import '../../screens/favorite/favorite.dart';
import '../../screens/settings/settings.dart';

import '../../../store/authentication.dart';

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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            elevation: 6,
            color: Colors.black,
            padding: const EdgeInsets.all(10),
            offset: const Offset(0, 50),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.sell_outlined, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                value: 'cart',
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.favorite_outline, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    'Favorite',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                value: 'favorite',
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.settings_outlined, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                value: 'settings',
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 15),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ]),
                value: 'logout',
              ),
            ],
            onSelected: (selectedValue) {
              switch (selectedValue) {
                case 'cart':
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                  break;
                case 'favorite':
                  Navigator.of(context).pushNamed(FavoriteScreen.routeName);
                  break;
                case 'settings':
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                  break;
                case 'logout':
                  Provider.of<Authentication>(context, listen: false).logout();
                  break;
                default:
                  Provider.of<Authentication>(context, listen: false).logout();
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
