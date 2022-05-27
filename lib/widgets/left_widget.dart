import 'package:bmi/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  final Color colorPal;
  const LeftBar(
      {Key? key, required this.barWidth, this.colorPal = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        height: 25,
        width: barWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: this.colorPal,
        ),
      )
    ]);
  }
}
