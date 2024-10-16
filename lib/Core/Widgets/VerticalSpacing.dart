import 'package:flutter/material.dart';

class Verticalspacing extends StatelessWidget {
  const Verticalspacing({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: height,
    );
  }
}