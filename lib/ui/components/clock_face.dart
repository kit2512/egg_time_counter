import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_counter/data/models/models.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          "I'll add this title later :)",
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xFFAA4648),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 200.w,
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
                  padding: EdgeInsets.all(6.h),
                  constraints: const BoxConstraints.expand(),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: CircularProgressIndicator(
                      strokeWidth: 8.h,
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
                    fontSize: 40.sp,
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
