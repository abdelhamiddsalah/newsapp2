import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String imageUrl;
  final Size size;

  const ImageSection({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FancyShimmerImage(
        boxFit: BoxFit.fill,
        errorWidget: Image.asset('assets/images/empty_image.png'),
        imageUrl: imageUrl,
        height: size.height * 0.33,
        width: double.infinity,
      ),
    );
  }
}
