import 'package:flutter/material.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

class StateInherted extends InheritedWidget {
  final Articles article;

  StateInherted(this.article, {Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant StateInherted oldWidget) {
    return oldWidget.article != article;
  }

 static StateInherted? of(BuildContext context) {
   return context.dependOnInheritedWidgetOfExactType<StateInherted>();
  }
}
