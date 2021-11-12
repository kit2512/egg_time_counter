import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_counter/data/models/models.dart';
import '../../config/config.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  final double size;
  final double? textFontSize;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.size,
    this.textColor,
    this.backgroundColor,
    this.textFontSize,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: textFontSize ?? getPWidth(18),
              fontWeight: FontWeight.w500,
              color:
                  textColor ?? Provider.of<ItemManager>(context).selectedColor,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
