import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/RecordingTime.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Core/widgets/rowInhomeinlistview.dart';
import 'package:newsapp/Features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/revelncyFeature/ui/widgets/imageinSorting.dart';

// ignore: camel_case_types
class content_cart extends StatelessWidget {
  const content_cart({
    super.key,
    required this.item,
  });
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ArticleImagesorting(
                imageUrl: item.article.urlToImage),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.article.title ??'No title available',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  const Verticalspacing(height: 6),
                  const RecordingTime(),
                  const Verticalspacing(height: 6),
                  const RowInListViewInHome(),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).removeFromCart(item);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
