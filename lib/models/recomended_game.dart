import 'package:flutter/material.dart';

class RecomendedGame {
  final String title;
  final String image;
  final String logo;
  final String description;

  RecomendedGame({
    required this.title,
    required this.image,
    this.logo = '',
    this.description = '',
  });
}
