import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:newsapp/core/Widgets/Loadinwidget.dart';
import 'package:newsapp/core/widgets/main_drawer.dart';
import 'package:newsapp/core/widgets/vertical_spacing.dart';
import 'package:newsapp/core/widgets/webview_article.dart';
import 'package:newsapp/Features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/detailsFeature/logic/Details_cubit/details_cubit_cubit.dart';
import 'package:newsapp/Features/detailsFeature/ui/widgets/icon_in_details.dart';
import 'package:newsapp/Features/detailsFeature/ui/widgets/image_in_details.dart';
import 'package:newsapp/Features/detailsFeature/ui/widgets/texts_in_details.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart'; // تأكد من تطابق هذا المسار مع هيكل المشروع.
class DetailsViewBody extends StatelessWidget {
  final Articles article;
  const DetailsViewBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubitCubit()..loadArticleDetails(article),
      child: BlocBuilder<DetailsCubitCubit, DetailsCubitState>(
        builder: (context, state) {
          if (state is ArticleDetailsLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.article.author ?? 'Article Details'),
              ),
              drawer: const MainDrawer(),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.article.title ?? 'No title',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const verticalspacing(height: 10),
                      Stack(
                        children: [
                          ArticleImage(
                            imageUrl: state.article.urlToImage!,
                          ),
                          Positioned(
                            bottom: 5,
                            right: 10,
                            child: Row(
                              children: [
                                CustomIconButton(
                                  icon: Icons.bookmark,
                                  onPressed: () {
                                    context
                                        .read<CartCubit>()
                                        .addToCart(state.article);
                                    EasyLoading.dismiss();
                                    EasyLoading.showSuccess('Added To BookMarks!');
                                  },
                                ),
                                const SizedBox(width: 10),
                                CustomIconButton(
                                  icon: Icons.share,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WebviewDetails(
                                          article: article,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const verticalspacing(height: 22),
                      ArticleSection(
                        title: 'Description',
                        content: state.article.description ?? 'No description',
                      ),
                      const verticalspacing(height: 9),
                      ArticleSection(
                        title: 'Content',
                        content: state.article.content ?? 'No content',
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
