import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';

class Draweheader extends StatelessWidget {
  const Draweheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Image.asset('assets/images/newspaper.png', height: 60,width: 60,)),
       const Verticalspacing(height: 20),
        Text('News App',style: GoogleFonts.lobster(fontWeight: FontWeight.bold, fontSize: 20)),
      ],
    );
  }
}