// lib/Widgets/article_image.dart
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ArticleImagesorting extends StatelessWidget {
  final String? imageUrl;

  const ArticleImagesorting({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: FancyShimmerImage(
        height: 90,
        width: 90,
        boxFit: BoxFit.fill,
        imageUrl: imageUrl ?? '',
        errorWidget: Image.asset(
          'assets/images/empty_image.png',
          color: Theme.of(context).textSelectionTheme.cursorColor,
        ),
      ),
    );
  }
}