import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/Loadinwidget.dart';
import 'package:newsapp/Core/Widgets/MainDrawer.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Features/Home/Presentation/Views/Details_view.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/RecordingTime.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/RowInhomeinlistview.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/imageinSorting.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/News_cubit/news_cubit_cubit.dart';

class Revelncy extends StatelessWidget {
  const Revelncy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubitCubit, NewsCubitState>(
      builder: (context, state) {
        if (state is GetAllnewsSorted) {
          return Scaffold(
            appBar: AppBar(title:const Text('News Sorted by Relevancy')),
            drawer:const MainDrawer(),
            body: ListView.builder(
              itemCount: state.newslist.articles!.length,
              itemBuilder: (context, index) {
                final article = state.newslist.articles![index]; 
                return GestureDetector( 
                  onTap: () {
                    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsView(article: state.newslist.articles![index]),
        ),
      );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Theme.of(context).cardColor,
                      child: Stack(
                        children: [
                          ContainerMethod(context),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: ContainerMethod(context),
                          ),
                          Container(
                            color: Theme.of(context).cardColor,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [ArticleImagesorting(imageUrl: article.urlToImage),
                              const  SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        article.title ?? 'No title available',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Verticalspacing(height: 6),
                                     RecordingTime(),
                                      Verticalspacing(height: 6),
                                     RowInlistviewinHome(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return LoadingWidgget();
      },
    );
  }
  Container ContainerMethod(BuildContext context) {
    return Container(
                          height: 60,
                          width: 60,
                          color: Theme.of(context).colorScheme.secondary,
                        );
  }
}
