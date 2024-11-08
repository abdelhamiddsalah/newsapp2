import 'package:flutter/material.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

class StateInherted extends InheritedWidget {
  final Articles article;

  const StateInherted(this.article, {super.key, required super.child});

  @override
  bool updateShouldNotify(covariant StateInherted oldWidget) {
    return oldWidget.article != article;
  }

 static StateInherted? of(BuildContext context) {
   return context.dependOnInheritedWidgetOfExactType<StateInherted>();
  }
}
