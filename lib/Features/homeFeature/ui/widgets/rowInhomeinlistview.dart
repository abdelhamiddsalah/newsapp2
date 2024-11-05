import 'package:flutter/material.dart';

class RowInlistviewinHome extends StatelessWidget {
  const RowInlistviewinHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.link,
            color: Colors.blue,
          ),),
       Text(maxLines: 1, '20-2-2020' * 2),
      ],
    );
  }
}