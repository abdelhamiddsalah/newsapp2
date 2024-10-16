/*import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/News_cubit/news_cubit_cubit.dart';

class Articlewidget extends StatelessWidget {
  const Articlewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubitCubit, NewsCubitState>(
      builder: (context, state) {
        if (state is GetAllNews) {
          return Container(
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              FancyShimmerImage(
                  height: 60, width: 60, boxFit: BoxFit.fill, imageUrl: state.newslist.articles[index])
            ],
          ),
        );
        }else{
                  return Center(child: CircularProgressIndicator());
                 }
      },
    );
  }
}*/
