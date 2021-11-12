import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_counter/data/models/models.dart';
import 'dart:math';

import '../../config/config.dart';

class ClockFace extends StatelessWidget {
  final String currentTime;
  final double value;
  const ClockFace({
    required this.currentTime,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "I\'ll add this title later :)",
          style: TextStyle(
            fontSize: getPWidth(18),
            color: const Color(0xFFAA4648),
          ),
        ),
        SizedBox(
          height: getPHeight(8),
        ),
        SizedBox(
          height: getPWidth(200),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(getPHeight(6)),
                  constraints: const BoxConstraints.expand(),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: CircularProgressIndicator(
                      strokeWidth: getPHeight(8),
                      backgroundColor: Colors.white,
                      value: value,
                      color: Provider.of<ItemManager>(context).selectedColor,
                    ),
                  ),
                ),
                Text(
                  currentTime,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Provider.of<ItemManager>(context).selectedColor,
                    fontSize: getPWidth(36),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
