import 'package:flutter/material.dart';

class Item {
  final Duration duration;
  final String imageUrl;
  final String name;
  final Color? color;

  Item({
    required this.imageUrl,
    required this.duration,
    required this.name,
    this.color,
  });
}
