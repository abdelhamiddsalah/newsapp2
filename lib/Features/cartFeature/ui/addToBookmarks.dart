import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/Features/cartFeature/ui/widgets/content_cart.dart';
import 'package:newsapp/Features/cartFeature/ui/widgets/no_items_in_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartcubitState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          final cartItems = state.cartItems;
          if (cartItems.isEmpty) {
            return const no_items_in_cart();
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
                    return content_cart(item: item);
                  },
                ),
              ),
            ),
          );
        }
        return const no_items_in_cart();
      },
    );
  }
}
