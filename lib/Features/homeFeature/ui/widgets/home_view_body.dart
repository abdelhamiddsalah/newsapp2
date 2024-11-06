import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/MainDrawer.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Core/enums/ThemeStates.dart';
import 'package:newsapp/Features/homeFeature/logic/PageCubit/page_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/logic/newsState/news_state_cubit.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/AppbarInhome.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/DropDownInhome.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/PaesNumbersInhome.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/TitelsInHome.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/listviewArticlesInHome.dart';
import 'package:newsapp/Features/top_trending_feature/ui/topTrending_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => NewsStateCubit()..changeNewsType(newsapp.Allnews),
      child: Scaffold(
        appBar: const Appbarwidget(),
        drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: SafeArea(
            child: BlocBuilder<NewsStateCubit, newsapp>(
              builder: (context, newsType) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.read<NewsStateCubit>().changeNewsType(newsapp.Allnews),
                          child: TitelsInHome(
                            title: 'All News',
                            color: newsType == newsapp.Allnews
                                ? Theme.of(context).cardColor
                                : Colors.transparent,
                            fontsize: newsType == newsapp.Allnews ? 18 : 14,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => context.read<NewsStateCubit>().changeNewsType(newsapp.TopTrending),
                          child: TitelsInHome(
                            title: 'Top Trending',
                            color: newsType == newsapp.TopTrending
                                ? Theme.of(context).cardColor
                                : Colors.transparent,
                            fontsize: newsType == newsapp.TopTrending ? 18 : 14,
                          ),
                        ),
                      ],
                    ),
                    const verticalspacing(height: 15),
                    if (newsType == newsapp.Allnews)
                      BlocProvider(
                        create: (context) => PaginationCubit(),
                        child: PaginationWidget(),
                      ),
                    const verticalspacing(height: 10),
                    if (newsType == newsapp.Allnews)
                      const Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Dropdowninhome(),
                        ),
                      ),
                    const verticalspacing(height: 10),
                    if (newsType == newsapp.Allnews)
                      const ListViewArticlesInHome()
                    else
                      const ToptrendingView(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
