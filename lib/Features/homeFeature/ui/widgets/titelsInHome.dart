import 'package:flutter/material.dart';

class TitelsInHome extends StatelessWidget {
  const TitelsInHome({
    super.key, required this.title, required this.color, required this.fontsize,
  });
  final String title;
  final Color color;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(11.0),
      child: Text(
       title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: fontsize,
          color:Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
