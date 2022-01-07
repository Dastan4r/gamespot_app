import 'package:flutter/material.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String title;
  final String link;

  const CategoryTitleWidget({Key? key, required this.title, this.link = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (link.isNotEmpty)
          Text(
            link,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 17,
            ),
          ),
      ],
    );
  }
}
