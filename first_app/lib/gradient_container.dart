import "package:flutter/material.dart";
import 'package:first_app/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  const GradientContainer({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 20),
      child: Center(child: DiceRoller()),
    );
  }
}
