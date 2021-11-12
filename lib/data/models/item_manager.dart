import 'package:flutter/cupertino.dart';
import 'package:time_counter/config/config.dart';
import 'package:flutter/material.dart';

import './item.dart';

class ItemManager extends ChangeNotifier {
  int _selectedItem = 0;
  Color selectedColor = kPrimaryColor;
  final List<Item> items = [
    Item(
      duration: const Duration(
        seconds: 15,
      ),
      imageUrl: "assets/images/egg_1.svg",
      name: "Soft boiled eggs",
      color: Colors.blue,
    ),
    Item(
        duration: const Duration(
          minutes: 1,
          seconds: 15,
        ),
        imageUrl: "assets/images/egg_2.svg",
        name: "Overcooked boiled eggs",
        color: Colors.amber),
    Item(
      duration: const Duration(
        minutes: 2,
        seconds: 10,
      ),
      imageUrl: "assets/images/egg_3.svg",
      name: "Undercooked boiled eggs",
      color: Colors.red,
    ),
  ];

  Item get curerntItem => items[_selectedItem];

  void goToItem(int index) {
    _selectedItem = index;
    selectedColor = items[_selectedItem].color ?? kPrimaryColor;
    notifyListeners();
  }
}
