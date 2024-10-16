import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Core/Widgets/VerticalSpacing.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/RecordingTime.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/RowInhomeinlistview.dart';
import 'package:newsapp/Features/Home/Presentation/Views/widgets/imageinSorting.dart';
import 'package:newsapp/Features/Home/Presentation/Views_models/Cart_cubit/cartcubit_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartcubitCubit, CartcubitState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          final cartItems = state.cartItems;
          if (cartItems.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(
                  'No items in the cart',
                  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Theme.of(context).cardColor,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                            padding:const EdgeInsets.all(10),
                            margin:const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                ArticleImagesorting(imageUrl: item.article.urlToImage),
                               const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.article.title ?? 'No title available',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    const  Verticalspacing(height: 6),
                                     const RecordingTime(),
                                     const Verticalspacing(height: 6),
                                   const  RowInlistviewinHome(),
                                      IconButton(
                                        icon:const Icon(Icons.remove),
                                        onPressed: () {
                                          BlocProvider.of<CartcubitCubit>(context).removeFromCart(item);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Scaffold(
              body: Center(
                child: Text(
                  'No items in the cart',
                  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color, fontWeight: FontWeight.bold),
                ),
              ),
            );
      },
    );
  }
}
