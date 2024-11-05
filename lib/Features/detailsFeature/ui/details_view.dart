import 'package:flutter/material.dart';
import 'package:newsapp/Features/detailsFeature/ui/widgets/details_view_body.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

class DetailsView extends StatelessWidget {
  final Articles article;

  const DetailsView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(aricle: article,), // No need to pass providers here
    );
  }
}
