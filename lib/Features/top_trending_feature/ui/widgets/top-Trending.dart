import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/widgets/loadinwidget.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';

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
                height: size.height * 0.5, // تحديد ارتفاع ثابت
                child: Swiper(
                  layout: SwiperLayout.STACK,
                  autoplay: true,
                  autoplayDelay: 8000,
                  itemWidth: size.width * 0.8,
                  viewportFraction: 0.9,
                  itemCount: state.newslist.articles!.length,
                  itemBuilder: (context, index) {
                    final article = state.newslist.articles![index];
                    return InkWell(
                      onTap: () {
                        // ضع هنا ما يحدث عند الضغط
                      },
                      child: Container(
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: FancyShimmerImage(
                                boxFit: BoxFit.fill,
                                errorWidget: Image.asset('assets/images/empty_image.png'),
                                imageUrl: article.urlToImage ?? '',
                                height: size.height * 0.33,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                article.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Theme.of(context).textTheme.bodyLarge!.color,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {}, // ضع الإجراء المناسب هنا
                                  icon: Icon(
                                    Icons.link,
                                    color: Theme.of(context).textSelectionTheme.cursorColor,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
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
