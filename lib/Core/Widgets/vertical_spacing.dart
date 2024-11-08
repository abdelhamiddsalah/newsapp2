// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class verticalspacing extends StatelessWidget {
  const verticalspacing({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: height,
    );
  }
}