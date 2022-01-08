import 'package:flutter/material.dart';

import '../../widgets/app/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/checkout';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        withoutBackButton: false,
        alignLeft: true,
      ),
      body: Text('Cart'),
    );
  }
}
