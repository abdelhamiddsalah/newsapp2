import 'package:flutter/material.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final Articles article;

  const DetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: DetailsViewBody(article: article,), // No need to pass providers here
    );
  }
}
