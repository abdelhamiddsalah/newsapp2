// ignore: file_names
import 'package:flutter/material.dart';

class RecordingTime extends StatelessWidget {
  const RecordingTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        '🕗 Recording time',
      ),
    );
  }
}