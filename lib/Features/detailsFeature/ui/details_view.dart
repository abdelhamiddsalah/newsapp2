import 'package:flutter/material.dart';
import 'package:newsapp/Features/detailsFeature/ui/widgets/details_view_body.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

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
