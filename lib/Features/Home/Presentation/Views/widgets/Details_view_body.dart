import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/Loadinwidget.dart';
import 'package:newsapp/Core/Widgets/MainDrawer.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/IconInDetails.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/ImageInDetails.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/TextsInDetails.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Details_cubit/details_cubit_cubit.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubitCubit, DetailsCubitState>(
      builder: (context, state) {
        if (state is ArticleDetailsLoaded) {
          return Scaffold(
            appBar: AppBar(title: Text(state.article.author ?? 'Article Details'),),
            drawer:const MainDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.article.title ?? 'No title',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Verticalspacing(height: 10),
                    Stack(children: [
                     ArticleImage(imageUrl: state.article.urlToImage!,),
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Row(
                          children: [
                            CustomIconButton(icon: Icons.bookmark, onPressed:(){context.read<CartcubitCubit>().addToCart(state.article);},),
                            const  SizedBox(width: 10,),
                           CustomIconButton(icon: Icons.share, onPressed: () {},)
                          ],
                        ),
                      )
                    ]),
                   const Verticalspacing(height: 22),
                    ArticleSection(
                      title: 'Description',
                      content: state.article.description ?? 'No description',
                    ),
                   const Verticalspacing(height: 9),
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
          return LoadingWidgget();
        }
      },
    );
  }
}
