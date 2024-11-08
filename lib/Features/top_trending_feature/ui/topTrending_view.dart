import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/top_trending_feature/ui/widgets/top-Trending.dart';
import 'package:newsapp/Core/di/get_it.dart';

class ToptrendingView extends StatelessWidget {
  const ToptrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubitCubit>()..emitGetAllTopnews(),
      child: const TopTrendingWidget(),
    );
  }
}
