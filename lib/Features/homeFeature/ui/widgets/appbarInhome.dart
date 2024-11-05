import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Features/searchFeature/ui/search_view.dart';
import 'package:page_transition/page_transition.dart';

class Appbarwidget extends StatelessWidget implements PreferredSizeWidget{
  const Appbarwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'News App',
        style: GoogleFonts.lobster(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      actions: [
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 12),
          child: IconButton(onPressed: (){
            Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: SearchView(),
        inheritTheme: true,
        ctx: context),
);
          }, icon:const Icon(Icons.search))
        ),
      ],
    );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}