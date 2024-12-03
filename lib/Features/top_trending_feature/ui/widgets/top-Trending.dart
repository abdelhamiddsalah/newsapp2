import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/widgets/loadinwidget.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'top_trending_item.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: BlocBuilder<NewsCubitCubit, NewsCubitState>(
  builder: (context, state) {
    if (state is GetTopNews) {
      return SizedBox(
        height: size.height * 0.5,
        child: Swiper(
          layout: SwiperLayout.STACK,
          autoplay: true,
          autoplayDelay: 8000,
          itemWidth: size.width * 0.8, // تحديد العرض
          viewportFraction: 0.9,
          itemCount: state.newslist.articles!.length,
          itemBuilder: (context, index) {
            final article = state.newslist.articles![index];
            return TopTrendingItem(article: article); // العنصر المحدد
          },
        ),
      );
    } else {
      return const LoadingWidget();
    }
  },
),

      ),
    );
  }
}
