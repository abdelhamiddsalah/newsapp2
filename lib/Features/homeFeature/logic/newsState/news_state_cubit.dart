import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Core/enums/ThemeStates.dart';

part 'news_state_state.dart';

class NewsStateCubit extends Cubit<newsapp> {
  NewsStateCubit() : super(newsapp.Allnews);
  void changeNewsType(newsapp newsType) {
    emit(newsType);
  }
}
