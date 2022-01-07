import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoriesListWidget extends StatelessWidget {
  final List<Category> categories;

  const CategoriesListWidget({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 120.0,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.asset(
                    categories[index].image,
                    width: MediaQuery.of(context).size.width * 0.66,
                  ),
                  Positioned(
                    top: 45,
                    left: 16,
                    child: Text(
                      categories[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: categories.length,
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
