import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/Loadinwidget.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Features/detailsFeature/logic/Details_cubit/details_cubit_cubit.dart';
import 'package:newsapp/Features/detailsFeature/ui/details_view.dart';
import 'package:newsapp/Core/Widgets/RecordingTime.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/RowInhomeinlistview.dart';

class ListViewArticlesInHome extends StatelessWidget {
  const ListViewArticlesInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsCubitCubit, NewsCubitState>(
        builder: (context, state) {
          if (state is GetAllNews) {
            return ListView.builder(
              itemCount: state.newslist.articles!.length,
              itemBuilder: (context, index) {
                final article = state.newslist.articles![index]; 
                return GestureDetector( 
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => DetailsCubitCubit()..loadArticleDetails(article),
                          child: DetailsView(article: article),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Theme.of(context).cardColor,
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              width: 60,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Container(
                            color: Theme.of(context).cardColor,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child: FancyShimmerImage(
                                    height: 90,
                                    width: 90,
                                    boxFit: BoxFit.fill,
                                    imageUrl: article.urlToImage?.isNotEmpty == true
                                        ? article.urlToImage!
                                        : 'https://your-placeholder-image-url.com/placeholder.png',
                                    errorWidget: Image.asset(
                                      'assets/images/empty_image.png',
                                      color: Theme.of(context).textSelectionTheme.cursorColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title ?? 'No title available',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const Verticalspacing(height: 6),
                                      RecordingTime(),
                                      const Verticalspacing(height: 6),
                                      const RowInlistviewinHome(),
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
            );
          } else {
            return const LoadingWidgget();
          }
        },
      ),
    );
  }
}
