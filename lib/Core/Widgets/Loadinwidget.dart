import 'package:flutter/material.dart';

class LoadingWidgget extends StatelessWidget {
  const LoadingWidgget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
