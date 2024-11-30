// ignore: file_names
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

// ignore: camel_case_types
class imageInHomeInlistview extends StatelessWidget {
  const imageInHomeInlistview({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:const BorderRadius.all(Radius.circular(10)),
      child: FancyShimmerImage(
        height: 90,
        width: 90,
        boxFit: BoxFit.fill,
        imageUrl: article.urlToImage?.isNotEmpty == true
            ? article.urlToImage!
            : 'https://your-placeholder-image-url.com/placeholder.png',
        errorWidget: Image.asset(
          'assets/images/empty_image.png',
          color: Theme.of(context).textSelectionTheme.cursorColor,
        ),
      ),
    );
  }
}
