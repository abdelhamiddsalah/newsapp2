part of 'details_cubit_cubit.dart';

@immutable
sealed class DetailsCubitState {}

final class DetailsCubitInitial extends DetailsCubitState {}
class ArticleDetailsLoaded extends DetailsCubitState {
  final Articles article;

  ArticleDetailsLoaded(this.article);
}


