import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/Loadinwidget.dart';
import 'package:newsapp/Features/detailsFeature/ui/details_view.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/card_in_home_list.dart';


class ListViewArticlesInHome extends StatelessWidget {
  const ListViewArticlesInHome({super.key});

  @override
  Widget build(BuildContext context) {
    //final articleNews=context.dependOnInheritedWidgetOfExactType<StateInherted>();
    return Expanded(
      child: BlocBuilder<NewsCubitCubit, NewsCubitState>(
        builder: (context, state) {
          if (state is GetAllNews) {
            final articles = state.newslist.articles; // Normal news list
            return ListView.builder(
              itemCount: articles?.length ?? 0, // Safe access
              itemBuilder: (context, index) {
                final article = articles![index]; // Non-nullable assertion since articles are expected to be non-null
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(article: article),
                      ),
                    );
                  },
                  child: cardInHomeList(article: article),
                );
              },
            );
          }  if (state is GetAllnewsSorted) {
            final articles = state.newslist.articles; // Sorted news list

            return ListView.builder(
              itemCount: articles?.length ?? 0, // Safe access
              itemBuilder: (context, index) {
                final article = articles![index]; // Non-nullable assertion since articles are expected to be non-null
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(article: article),
                      ),
                    );
                  },
                  child: cardInHomeList(article: article),
                );
              },
            );
            
          } 
          if (state is GetAllnewsSortedpage) {
            final articles = state.newslist.articles; // Sorted news list

            return ListView.builder(
              itemCount: articles?.length ?? 0, // Safe access
              itemBuilder: (context, index) {
                final article = articles![index]; // Non-nullable assertion since articles are expected to be non-null
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(article: article),
                      ),
                    );
                  },
                  child: cardInHomeList(article: article),
                );
              },
            );
            
          }
          else if (state is NewsCubitInitial) {
            return const LoadingWidget(); // Show loading widget initially
          } else {
            return const Center(child: Text('No Data')); // Fallback for other states
          }
        },
      ),
    );
  }
}
