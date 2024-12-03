import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String imageUrl;
  
  const ArticleImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: FancyShimmerImage(
        height: 270,
        width: double.infinity,
        boxFit: BoxFit.fill,
        imageUrl: imageUrl,
        errorWidget: Image.asset(
          'assets/images/empty_image.png',
          color: Theme.of(context).textSelectionTheme.cursorColor,
        ),
      ),
    );
  }
}
