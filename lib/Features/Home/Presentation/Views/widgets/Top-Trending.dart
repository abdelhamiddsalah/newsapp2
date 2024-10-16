import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/News_cubit/news_cubit_cubit.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () {},
          child: BlocBuilder<NewsCubitCubit, NewsCubitState>(
            builder: (context, state) {
              if (state is GetTopNews) {
                return SizedBox(
                  height: size.height * 0.5,
                  child: Swiper(
                    layout: SwiperLayout.STACK,
                    autoplay: true,
                    autoplayDelay: 8000,
                    itemWidth: size.width*0.8,
                   viewportFraction: 0.9,
                    itemCount: state.newslist.articles!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Theme.of(context).cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: FancyShimmerImage(
                                boxFit: BoxFit.fill,
                                errorWidget: Image.asset('assets/images/empty_image.png'),
                                imageUrl: state.newslist.articles![index].urlToImage.toString(),
                                height: size.height * 0.33,
                                width: double.infinity,
                              ),
                            ),
                          const  SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                state.newslist.articles![index].title.toString(),
                                style:  TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14, color: Theme.of(context).textTheme.bodyLarge!.color),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon:  Icon(
                                    Icons.link,
                                    color: Theme.of(context).textSelectionTheme.cursorColor,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}