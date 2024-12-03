import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchResults extends StatelessWidget {
   SearchResults({super.key});

  final List<String> searchWords = [
    'Flutter',
    'Dart',
    'State Management',
    'Cubit',
    'Provider',
    'Bloc',
    'Riverpod',
    'MVC',
    'Clean Architecture',
  ];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: searchWords.length,
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                searchWords[index],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
