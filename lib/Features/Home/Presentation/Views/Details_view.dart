import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/Details_view_body.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Details_cubit/details_cubit_cubit.dart';
import 'package:newsapp/Features/Home/data/Models/News.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.article});
final Articles article;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubitCubit()..loadArticleDetails(article),
      child: DetailsViewBody(),
    );
  }
}
