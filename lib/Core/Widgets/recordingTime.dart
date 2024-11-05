import 'package:flutter/material.dart';

class RecordingTime extends StatelessWidget {
  const RecordingTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: Text(
        '🕗 Recording time',
      ),
    );
  }
}