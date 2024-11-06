import 'package:flutter/material.dart';

// ignore: camel_case_types
class no_items_in_cart extends StatelessWidget {
  const no_items_in_cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No items in the cart',
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
