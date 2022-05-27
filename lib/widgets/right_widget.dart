import 'package:bmi/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  final Color colorPal;
  const RightBar(
      {Key? key, required this.barWidth, this.colorPal = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: 25,
        width: barWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: this.colorPal,
        ),
      )
    ]);
  }
}
