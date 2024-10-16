// lib/Widgets/article_section.dart
import 'package:flutter/material.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';

class ArticleSection extends StatelessWidget {
  final String title;
  final String content;

  const ArticleSection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        Verticalspacing(height: 10),
        Text(content, style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
