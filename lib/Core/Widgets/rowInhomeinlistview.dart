// ignore: file_names
import 'package:flutter/material.dart';

class RowInListViewInHome extends StatelessWidget {
  const RowInListViewInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.link,
            color: Colors.blue,
          ),
        ),
        Text(
          '20-2-2020' * 2, // Your date string
          maxLines: 1,
        ),
      ],
    );
  }
}
